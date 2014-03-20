class PermisosController < ApplicationController
  before_action :set_permiso, only: [:show, :edit, :update, :destroy]
  before_action :set_modelo, only: [:new]
  
  # GET /permisos
  # GET /permisos.json
  def index
    @permisos = Permiso.all
  end

  # GET /permisos/1
  # GET /permisos/1.json
  def show
  end

  # GET /permisos/new
  def new
    
    @modulos = Modelo.all
    @perfil_permiso = Permiso.new
    @perfil = Perfil.find(params[:perfil_id])
    @funcionalidades = nil
    codigos_func = ""
    
    unless @modelo.nil? then
      if @modelo.mdl_codigo.blank? then
      
      
      
      else
      
        #@modulo = Modelo.find_by mdl_codigo: params[:mdl_codigo]
        funcion_control = FuncionControl.where("modelo_id = " + @modelo.id.to_s)
        
        funcion_control.each do |fc|
          codigos_func = codigos_func.to_s + fc.funcionalidad_id.to_s + ","          
        end
        
        codigos_func = codigos_func[0, codigos_func.length-1] # se elimina la ultima coma  
        @funcionalidades = Funcionalidad.where("id IN (#{codigos_func})") 
      end
    end
  end

  # GET /permisos/1/edit
  def edit
  end

  # POST /permisos
  # POST /permisos.json
  def create
    @permiso = Permiso.new(permiso_params)
    @modulos = Modelo.all
    
    respond_to do |format|
      # if @permiso.save
        # format.html { redirect_to @permiso, notice: 'Permiso otorgados exitosamente.' }
        # format.json { render action: 'show', status: :created, location: @permiso }
      # else
         format.html { redirect_to @permiso }
        # format.json { render json: @permiso.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /permisos/1
  # PATCH/PUT /permisos/1.json
  def update
    respond_to do |format|
      if @permiso.update(permiso_params)
        format.html { redirect_to @permiso, notice: 'Permisos actualizados exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permisos/1
  # DELETE /permisos/1.json
  def destroy
    @permiso.destroy
    respond_to do |format|
      format.html { redirect_to permisos_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find_by mdl_codigo: params[:mdl_codigo].to_s
    end
    
    def set_permiso
      @permiso = Permiso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permiso_params
      params.fetch(:permiso,{}).permit(:id, :perfil_id, :funcionalidad_id, :mdl_codigo )
    end
end
