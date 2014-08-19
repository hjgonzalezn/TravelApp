class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]

  # GET /fotos
  # GET /fotos.json
  def index
    @fotos = Foto.all
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
  end

  # GET /fotos/new
  def new
    @foto = Foto.new
        
    unless params[:entidad_territorial_id].blank? then
      @foto.foto_categoria = "entidad_territorial"
      @foto.foto_llave_externa = params[:entidad_territorial_id] # a quien pertenece la foto
    end
    
  end
  
  # GET /fotos/1/edit
  def edit
  end

  # POST /fotos
  # POST /fotos.json
  def create
    @foto = Foto.new(foto_params)
    
    respond_to do |format|
      if @foto.save
        case @foto.foto_categoria
        when "entidad_territorial" then
          @entidad_territorial = EntidadTerritorial.find(@foto.foto_llave_externa)
          format.html { redirect_to edit_entidad_territorial_path(@entidad_territorial), notice: 'Fotografia cargada exitosamente.' }
          #format.json { render action: 'show', status: :created, location: @foto }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end    
      end
  end

  # PATCH/PUT /fotos/1
  # PATCH/PUT /fotos/1.json
  def update
    respond_to do |format|
      if @foto.update(foto_params)
        format.html { redirect_to @foto, notice: 'Foto actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto.destroy
    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto
      @foto = Foto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foto_params
      params.require(:foto).permit(:foto_nombre, :foto_mini, :foto_titulo, :foto_descripcion, :foto_categoria, :foto_llave_externa)
    end
end
