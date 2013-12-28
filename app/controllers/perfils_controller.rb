class PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]
  before_action :set_estado_registro, only: [:show, :edit, :new]

  # GET /perfils
  # GET /perfils.json
  def index
    condiciones = []
    cadena = "Catalogos.ctlg_categoria = 'ESTADO REGISTRO' AND prf_estado_registro = 'A' "
    index = 0
    
    @perfil = Perfil.new(perfil_params)

    unless @perfil.prf_nombre.blank? then
      condiciones[index] = "Upper(prf_nombre) LIKE '%#{@perfil.prf_nombre.to_s.upcase}%'"
      index += 1
    end
    
    unless @perfil.prf_descripcion.blank? then
      condiciones[index] = "Upper(prf_descripcion) LIKE '%#{@perfil.prf_descripcion.to_s.upcase}%'"
      index += 1
    end
    
    unless condiciones.empty? then
      condiciones.each do |condicion|
        if condicion != nil then
          # if condiciones.first == condicion then
            # cadena = cadena + condicion.to_s
          # else
            cadena = cadena + " AND " + condicion.to_s
          #end
        end
      end
      
      @perfils = Perfil.select('Perfils.id, prf_nombre, prf_descripcion, ctlg_valor_desc').joins('LEFT OUTER JOIN Catalogos ON Perfils.prf_Estado_Registro = ctlg_valor_cdg').where(cadena).limit(100)
    else
      @perfils = Perfil.select('Perfils.id, prf_nombre, prf_descripcion, ctlg_valor_desc').joins('LEFT OUTER JOIN Catalogos ON Perfils.prf_Estado_Registro = ctlg_valor_cdg').where(cadena).limit(100)
      #@perfils = Perfil.all.limit(100)
    end
  end

  # GET /perfils/1
  # GET /perfils/1.json
  def show
  end

  # GET /perfils/new
  def new
    @estados = Catalogo.select("ctlg_valor_cdg, ctlg_valor_desc").where("ctlg_categoria = 'ESTADO REGISTRO'")
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
    @estados = Catalogo.select("ctlg_valor_cdg, ctlg_valor_desc").where("ctlg_categoria = 'ESTADO REGISTRO'")
  end

  # POST /perfils
  # POST /perfils.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to @perfil, notice: 'Perfil creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @perfil }
      else
        format.html { render action: 'new' }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1
  # PATCH/PUT /perfils/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to @perfil, notice: 'Perfil actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1
  # DELETE /perfils/1.json
  def destroy
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfils_url }
      format.json { head :no_content }
    end
  end
  
  private
  
    def set_estado_registro
      if action_name == "new" then
        @estado_registro = "A"
      elsif action_name == "show" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @perfil.prf_estado_registro
        @estado_registro = catalogo.ctlg_valor_desc
      elsif action_name == "edit" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @perfil.prf_estado_registro
        @estado_registro = catalogo.ctlg_valor_cdg
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      #params.require(:perfil).permit(:prf_nombre, :prf_descripcion, :prf_estado_registro)
      params.fetch(:perfil, {}).permit(:prf_nombre, :prf_descripcion, :prf_estado_registro)
    end
end
