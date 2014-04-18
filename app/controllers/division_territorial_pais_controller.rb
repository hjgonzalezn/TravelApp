class DivisionTerritorialPaisController < ApplicationController
  
  include ApplicationHelper
  
  before_action :set_division_territorial_pai, only: [:show, :edit, :update, :destroy]
  before_action :set_datos_basicos, only: [:new, :create, :edit, :update]
  # GET /division_territorial_pais
  # GET /division_territorial_pais.json
  def index
    @division_territorial_pais = DivisionTerritorialPai.all
  end

  # GET /division_territorial_pais/1
  # GET /division_territorial_pais/1.json
  def show
  end

  # GET /division_territorial_pais/new
  def new
    @division_territorial_pai = DivisionTerritorialPai.new
  end

  # GET /division_territorial_pais/1/edit
  def edit
  end

  # POST /division_territorial_pais
  # POST /division_territorial_pais.json
  def create
    @division_territorial_pai = DivisionTerritorialPai.new(division_territorial_pai_params)

    respond_to do |format|
      if @division_territorial_pai.save
        format.html { redirect_to @division_territorial_pai, notice: 'Division territorial creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @division_territorial_pai }
      else
        format.html { render action: 'new' }
        format.json { render json: @division_territorial_pai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /division_territorial_pais/1
  # PATCH/PUT /division_territorial_pais/1.json
  def update
    
    respond_to do |format|
      if @division_territorial_pai.update(division_territorial_pai_params)
        format.html { redirect_to @division_territorial_pai, notice: 'Division territorial actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @division_territorial_pai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /division_territorial_pais/1
  # DELETE /division_territorial_pais/1.json
  def destroy
    @division_territorial_pai.destroy
    respond_to do |format|
      format.html { redirect_to division_territorial_pais_url }
      format.json { head :no_content }
    end
  end

    def set_estado_registro_actual
      if action_name == "new" then
        @estado_registro = "A"
      elsif action_name == "show" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @division_territorial_pai.dte_estado_registro
        @estado_registro = catalogo.ctlg_valor_desc
      elsif action_name == "edit" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @division_territorial_pai.dte_estado_registro
        @estado_registro = catalogo.ctlg_valor_cdg
      end
    end


  private
  
    def set_datos_basicos 
      set_estados_registro # todos los estados de un registro
      set_estado_registro_actual
      set_paises
      @divisionesTerritoriales = DivisionTerritorial.where("dvt_estado_registro = 'A'")
      @continentes = EntidadTerritorial.where("enter_padre = 1")
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_division_territorial_pai
      @division_territorial_pai = DivisionTerritorialPai.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def division_territorial_pai_params
      params.require(:division_territorial_pai).permit(:entidad_territorial_id, :division_territorial_id, :dte_nivel, :dte_estado_registro)
    end
end
