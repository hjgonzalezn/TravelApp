class CatalogosController < ApplicationController
  before_action :set_catalogo, only: [:show, :edit, :update, :destroy]
  before_action :set_estado_registro, only: [:show, :edit, :new]
  
  # GET /catalogos
  # GET /catalogos.json
  def index
    @categorias = Catalogo.select("ctlg_categoria").distinct.where("ctlg_categoria IS NOT NULL")
    @subcategorias = Catalogo.select("ctlg_subcategoria").distinct.where("ctlg_subcategoria IS NOT NULL")
    
    condiciones = []
    cadena = "ctlg_estado_registro = 'A'"
    
    @catalogo = Catalogo.new(catalogo_params)

    unless @catalogo.ctlg_categoria.blank? then
      condiciones.push("Upper(ctlg_categoria) = '#{@catalogo.ctlg_categoria.to_s.upcase}'")
    end
    
    unless @catalogo.ctlg_subcategoria.blank? then
      condiciones.push("Upper(ctlg_subcategoria) = '#{@catalogo.ctlg_subcategoria.to_s.upcase}'")
    end
    
    unless @catalogo.ctlg_valor_desc.blank? then
      condiciones.push("Upper(ctlg_valor_desc) LIKE '%#{@catalogo.ctlg_valor_desc.to_s.upcase}%'")
    end    
    
    if condiciones.any? then
      condiciones.each do |condicion|
        if condicion != nil then
            cadena = cadena + " AND " + condicion.to_s
        end
      end
      
      @catalogos = Catalogo.select('id, ctlg_categoria, ctlg_subcategoria, ctlg_valor_cdg, ctlg_valor_desc, ctlg_observacion, ctlg_estado_registro').where(cadena).limit(100)
    else
      @catalogos = Catalogo.none
    end
    
  end

  # GET /catalogos/1
  # GET /catalogos/1.json
  def show
  end

  # GET /catalogos/new
  def new
    @catalogo = Catalogo.new
    @categorias = Catalogo.select("ctlg_categoria").distinct.where("ctlg_categoria IS NOT NULL")
    @subcategorias = Catalogo.select("ctlg_subcategoria").distinct.where("ctlg_subcategoria IS NOT NULL")
    @estados = Catalogo.select("ctlg_valor_cdg, ctlg_valor_desc").where("ctlg_categoria = 'ESTADO REGISTRO'")
  end

  # GET /catalogos/1/edit
  def edit
    @categorias = Catalogo.select("ctlg_categoria").distinct.where("ctlg_categoria IS NOT NULL")
    @subcategorias = Catalogo.select("ctlg_subcategoria").distinct.where("ctlg_subcategoria IS NOT NULL")
    @estados = Catalogo.select("ctlg_valor_cdg, ctlg_valor_desc").where("ctlg_categoria = 'ESTADO REGISTRO'")
  end

  # POST /catalogos
  # POST /catalogos.json
  def create
    @catalogo = Catalogo.new(catalogo_params)
    @categorias = Catalogo.select("ctlg_categoria").distinct.where("ctlg_categoria IS NOT NULL")
    @subcategorias = Catalogo.select("ctlg_subcategoria").distinct.where("ctlg_subcategoria IS NOT NULL")
    @estados = Catalogo.select("ctlg_valor_cdg, ctlg_valor_desc").where("ctlg_categoria = 'ESTADO REGISTRO'")
    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to @catalogo, notice: 'Registro creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @catalogo }
      else
        format.html { render action: 'new' }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogos/1
  # PATCH/PUT /catalogos/1.json
  def update
    respond_to do |format|
      if @catalogo.update(catalogo_params)
        format.html { redirect_to @catalogo, notice: 'Registro actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogos/1
  # DELETE /catalogos/1.json
  def destroy
    @catalogo.destroy
    respond_to do |format|
      format.html { redirect_to catalogos_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_estado_registro
      if action_name == "new" then
        @estado_registro = "A"
      elsif action_name == "show" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @catalogo.ctlg_estado_registro
        @estado_registro = catalogo.ctlg_valor_desc
      elsif action_name == "edit" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: @catalogo.ctlg_estado_registro
        @estado_registro = catalogo.ctlg_valor_cdg
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogo
      @catalogo = Catalogo.find(params[:id])
      
      if action_name == "show" and @catalogo.ctlg_subcategoria.blank? then
        @catalogo.ctlg_subcategoria = "NINGUNA"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalogo_params
      #params.require(:catalogo).permit(:ctlg_categoria, :ctlg_subcategoria, :ctlg_valor_cdg, :ctlg_valor_desc, :ctlg_observacion, :ctlg_estado_registro)
      params.fetch(:catalogo, {}).permit(:ctlg_categoria, :ctlg_subcategoria, :ctlg_valor_cdg, :ctlg_valor_desc, :ctlg_observacion, :ctlg_estado_registro)
    end
end
