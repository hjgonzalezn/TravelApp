class DatoEntidadsController < ApplicationController
  before_action :set_dato_entidad, only: [:show, :edit, :update, :destroy]

  # GET /dato_entidads
  # GET /dato_entidads.json
  def index
    @dato_entidads = DatoEntidad.all
  end

  # GET /dato_entidads/1
  # GET /dato_entidads/1.json
  def show
  end

  # GET /dato_entidads/new
  def new
    @dato_entidad = DatoEntidad.new
  end

  # GET /dato_entidads/1/edit
  def edit
  end

  # POST /dato_entidads
  # POST /dato_entidads.json
  def create
    @dato_entidad = DatoEntidad.new(dato_entidad_params)

    respond_to do |format|
      if @dato_entidad.save
        format.html { redirect_to @dato_entidad, notice: 'Dato creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @dato_entidad }
      else
        format.html { render action: 'new' }
        format.json { render json: @dato_entidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dato_entidads/1
  # PATCH/PUT /dato_entidads/1.json
  def update
    respond_to do |format|
      if @dato_entidad.update(dato_entidad_params)
        format.html { redirect_to @dato_entidad, notice: 'Dato actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dato_entidad.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def somos
    @presentacion = DatoEntidad.find_by ent_dato_codigo: "PRESENTACION"
    @mision = DatoEntidad.find_by ent_dato_codigo: "MISION"
    @vision = DatoEntidad.find_by ent_dato_codigo: "VISION"
  end
  
  def contactenos
    
  end
  
  def home
    
  end
  
  # DELETE /dato_entidads/1
  # DELETE /dato_entidads/1.json
  def destroy
    @dato_entidad.destroy
    respond_to do |format|
      format.html { redirect_to dato_entidads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato_entidad
      @dato_entidad = DatoEntidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dato_entidad_params
      params.require(:dato_entidad).permit(:ent_dato_categoria, :ent_dato_subcategoria, :ent_dato_codigo, :ent_dato_descripcion, :ent_dato_valor, :ent_dato_observacion,:ent_dato_estado_registro)
    end
end
