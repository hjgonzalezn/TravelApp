class FuncionalidadsController < ApplicationController
  before_action :set_funcionalidad, only: [:show, :edit, :update, :destroy]

  # GET /funcionalidads
  # GET /funcionalidads.json
  def index
    @funcionalidads = Funcionalidad.all
  end

  # GET /funcionalidads/1
  # GET /funcionalidads/1.json
  def show
  end

  # GET /funcionalidads/new
  def new
    @funcionalidad = Funcionalidad.new
  end

  # GET /funcionalidads/1/edit
  def edit
    @funcionControls = FuncionControl.where("funcionalidad_id = #{@funcionalidad.id}")
  end

  # POST /funcionalidads
  # POST /funcionalidads.json
  def create
    @funcionalidad = Funcionalidad.new(funcionalidad_params)

    respond_to do |format|
      if @funcionalidad.save
        format.html { redirect_to @funcionalidad, notice: 'Funcionalidad creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @funcionalidad }
      else
        format.html { render action: 'new' }
        format.json { render json: @funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionalidads/1
  # PATCH/PUT /funcionalidads/1.json
  def update
    respond_to do |format|
      if @funcionalidad.update(funcionalidad_params)
        format.html { redirect_to @funcionalidad, notice: 'Funcionalidad actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionalidads/1
  # DELETE /funcionalidads/1.json
  def destroy
    @funcionalidad.destroy
    respond_to do |format|
      format.html { redirect_to funcionalidads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionalidad
      @funcionalidad = Funcionalidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionalidad_params
      params.require(:funcionalidad).permit(:func_descripcion, :func_publica, :func_padre)
    end
end
