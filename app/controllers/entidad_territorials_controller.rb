class EntidadTerritorialsController < ApplicationController
  include ApplicationHelper
  
  before_action :set_entidad_territorial, only: [:show, :edit, :update, :destroy]
  before_action :set_datos_basicos, only: [:new, :create, :edit, :update]

  # GET /entidad_territorials
  # GET /entidad_territorials.json
  def index
    @entidad_territorials = EntidadTerritorial.all
  end

  # GET /entidad_territorials/1
  # GET /entidad_territorials/1.json
  def show
  end

  # GET /entidad_territorials/new
  def new
    @entidad_territorial = EntidadTerritorial.new
  end

  # GET /entidad_territorials/1/edit
  def edit
    @divisiones_territoriales = DivisionTerritorial.select("id codigo, dvt_nombre descripcion").where("id in (SELECT division_territorial_id FROM division_territorial_pais WHERE entidad_territorial_id = #{@entidad_territorial.enter_padre})").map{|a| [a.descripcion, a.codigo]}
    @regiones = Region.where("entidad_territorial_id = #{@entidad_territorial.enter_padre}").map{|a| [a.reg_nombre, a.id]}
    @territorios_padres = set_territorios_padres(@entidad_territorial)
    @imagenes = Foto.where("foto_categoria = 'entidad_territorial' AND foto_llave_externa = #{@entidad_territorial.id}")
  end

  # POST /entidad_territorials
  # POST /entidad_territorials.json
  def create
    @entidad_territorial = EntidadTerritorial.new(entidad_territorial_params)

    respond_to do |format|
      if @entidad_territorial.save
        format.html { redirect_to @entidad_territorial, notice: 'Entidad territorial creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @entidad_territorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @entidad_territorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entidad_territorials/1
  # PATCH/PUT /entidad_territorials/1.json
  def update
    respond_to do |format|
      if @entidad_territorial.update(entidad_territorial_params)
        format.html { redirect_to @entidad_territorial, notice: 'Entidad territorial actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entidad_territorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entidad_territorials/1
  # DELETE /entidad_territorials/1.json
  def destroy
    @entidad_territorial.destroy
    respond_to do |format|
      format.html { redirect_to entidad_territorials_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_datos_basicos
      set_estados_registro
      
      if @entidad_territorial != nil then
        set_estado_registro_actual(@entidad_territorial.enter_estado_registro, action_name)
      else
        set_estado_registro_actual(nil, action_name)
      end
      
      @continentes = EntidadTerritorial.where("enter_padre = 1")
      #set_paises
      @divisiones_territoriales = DivisionTerritorial.where("dvt_estado_registro = 'A'")
      @rutaImagenes = ParametroSistema.select("psis_valor valor").where("psis_codigo = 'IMGET'").map{|t| t.valor}.pop.to_s
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_entidad_territorial
      @entidad_territorial = EntidadTerritorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entidad_territorial_params
      params.require(:entidad_territorial).permit(:enter_nombre_oficial, :enter_presentacion, :enter_padre, :enter_nivel, :enter_estado_registro, :region_id, :division_territorial_id)
    end
end
