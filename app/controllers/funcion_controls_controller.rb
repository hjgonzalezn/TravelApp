class FuncionControlsController < ApplicationController
  before_action :set_funcion_control, only: [:show, :edit, :update, :destroy]

  # GET /funcion_controls
  # GET /funcion_controls.json
  def index
    @funcion_controls = FuncionControl.all
  end

  # GET /funcion_controls/1
  # GET /funcion_controls/1.json
  def show
    @funcionalidad = Funcionalidad.find(params[:funcionalidad_id])
  end

  # GET /funcion_controls/new
  def new
    @funcionalidad_funcion_control = FuncionControl.new
    @funcionalidad = Funcionalidad.find(params[:funcionalidad_id])
    @modelos = Modelo.all
    @acciones = Accion.all
    @tipos_control = Catalogo.select("ctlg_valor_desc descripcion, ctlg_valor_cdg codigo").where("ctlg_categoria='APLICACION' AND ctlg_subcategoria = 'TIPO DE CONTROL'").order(ctlg_valor_desc: :asc)
  end

  # GET /funcion_controls/1/edit
  def edit
  end

  # POST /funcion_controls
  # POST /funcion_controls.json
  def create
    @funcion_control = FuncionControl.new(funcion_control_params)
    @funcionalidad = Funcionalidad.find(@funcion_control.funcionalidad_id)
    
    respond_to do |format|
      if @funcion_control.save
        format.html { redirect_to funcionalidad_funcion_control_path(@funcionalidad, @funcion_control), notice: 'Registro creado exitosamente.' }
        #format.json { render action: 'show', status: :created, location: @funcion_control }
        
      else
        format.html { render action: 'new' }
        format.json { render json: @funcion_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcion_controls/1
  # PATCH/PUT /funcion_controls/1.json
  def update
    respond_to do |format|
      if @funcion_control.update(funcion_control_params)
        format.html { redirect_to @funcion_control, notice: 'Registro actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @funcion_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcion_controls/1
  # DELETE /funcion_controls/1.json
  def destroy
    @funcion_control.destroy
    respond_to do |format|
      format.html { redirect_to funcion_controls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcion_control
      @funcion_control = FuncionControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcion_control_params
      params.require(:funcion_control).permit(:funcionalidad_id, :modelo_id, :accion_id, :control_id)
    end
end
