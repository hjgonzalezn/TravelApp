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
    @permiso = Permiso.find(params[:id])
    funcionControl = FuncionControl.where("funcionalidad_id = #{@permiso.funcionalidad_id}")
    unless funcionControl.nil? then
      funcionControl.each do |t|
        @modelo = Modelo.find(t.modelo_id)
      end
    end
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
      
        funcion_control = FuncionControl.where("modelo_id = " + @modelo.id.to_s)
        
        funcion_control.each do |fc|
          codigos_func = codigos_func.to_s + fc.funcionalidad_id.to_s + "," # Codigos de funcionalidad separados por coma         
        end
        
        unless codigos_func.blank? then
          codigos_func = codigos_func[0, codigos_func.length - 1] # se elimina la ultima coma  
          @funcionalidades = Funcionalidad.where("id IN (#{codigos_func})")
        end 
      end
    end
  end

  # GET /permisos/1/edit
  def edit
  end

  # POST /permisos
  # POST /permisos.json
  def create
    nuevasFuncionalidades = params[:funcionalidad_id]
    funcionalidadesModelo = []
    codigos_func = ""
    #funcionalidadesEliminar=[]
    perfil = params[:perfil]
    @perfil = Perfil.find(perfil[:id])
    
    begin
      @funcionalidadesModelo = Funcionalidad.select("Funcionalidads.func_descripcion, Funcionalidads.id").distinct.joins("LEFT OUTER JOIN Funcion_Controls " + 
                          "ON funcionalidads.id = Funcion_Controls.funcionalidad_id").where("Funcion_Controls.modelo_id = #{params[:modelo_id]}")
    
      @funcionalidadesModelo.each do |t|
        funcionalidadesModelo << t.id
        codigos_func = codigos_func.to_s + t.id.to_s + ","   
      end
      
      codigos_func = codigos_func[0, codigos_func.length - 1] # se elimina la ultima coma
      #funcionalidadesEliminar = funcionalidadesModelo - nuevasFuncionalidades
      
      puts "Funcionalidades Modelo"
      puts funcionalidadesModelo
      puts "Funcionalidades Nuevas >>"
      puts nuevasFuncionalidades

      #eliminar funcionalidades no autorizadas, si existen
      if funcionalidadesModelo.any? then
        funcionalidadesModelo.each do |f|
          permiso = Permiso.find_by perfil_id: @perfil.id, funcionalidad_id: f
          
          unless permiso.nil? then
            permiso.destroy
          end
        end
      end
      
      #crear las funcionalidades nuevas, si no existen
      unless nuevasFuncionalidades.nil? then
        nuevasFuncionalidades.each do |f|
          flagEntro = true
          @permiso = Permiso.find_by perfil_id: @perfil.id, funcionalidad_id: f

          if @permiso.nil? then
            @permiso = Permiso.new(perfil_id: @perfil.id, funcionalidad_id: f)
            @permiso.save
          end
        end
      end
      
      @permiso = Permiso.where("perfil_id = #{@perfil.id} AND funcionalidad_id IN (#{codigos_func})").take
      
      respond_to do |format|
        unless @permiso.nil? then
          @permiso = @permiso.id
          format.html { redirect_to perfil_permiso_path(@perfil, @permiso), notice: 'Permiso otorgados exitosamente.' }
          format.json { render action: 'show', status: :created, location: @permiso }
        else
          format.html { redirect_to edit_perfil_path(@perfil), notice: 'Permisos actualizados exitosamente.' }
        end      
      end
    # rescue Exception => msj
      # puts "ERROR >>>"  
      # puts msj
      # respond_to do |format|
        # format.html { render action: 'new' }
        # format.json { render json: @permiso.errors, status: :unprocessable_entity }
      # end
    end
    
    #@modulos = Modelo.all
    
    


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
