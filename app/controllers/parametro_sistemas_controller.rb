class ParametroSistemasController < ApplicationController
  before_action :set_parametro_sistema, only: [:show, :edit, :update, :destroy]

  # GET /parametro_sistemas
  # GET /parametro_sistemas.json
  def index
    @parametro_sistemas = ParametroSistema.all
  end

  # GET /parametro_sistemas/1
  # GET /parametro_sistemas/1.json
  def show
  end

  # GET /parametro_sistemas/new
  def new
    @parametro_sistema = ParametroSistema.new
  end

  # GET /parametro_sistemas/1/edit
  def edit
  end

  # POST /parametro_sistemas
  # POST /parametro_sistemas.json
  def create
    @parametro_sistema = ParametroSistema.new(parametro_sistema_params)

    respond_to do |format|
      if @parametro_sistema.save
        format.html { redirect_to @parametro_sistema, notice: 'Parametro del sistema creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @parametro_sistema }
      else
        format.html { render action: 'new' }
        format.json { render json: @parametro_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parametro_sistemas/1
  # PATCH/PUT /parametro_sistemas/1.json
  def update
    respond_to do |format|
      if @parametro_sistema.update(parametro_sistema_params)
        format.html { redirect_to @parametro_sistema, notice: 'Parametro del sistema actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parametro_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parametro_sistemas/1
  # DELETE /parametro_sistemas/1.json
  def destroy
    @parametro_sistema.destroy
    respond_to do |format|
      format.html { redirect_to parametro_sistemas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parametro_sistema
      @parametro_sistema = ParametroSistema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametro_sistema_params
      params.require(:parametro_sistema).permit(:psis_categoria, :psis_codigo, :psis_valor, :psis_descripcion, :psis_estado_registro)
    end
end
