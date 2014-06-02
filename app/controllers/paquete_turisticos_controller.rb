class PaqueteTuristicosController < ApplicationController
  before_action :set_paquete_turistico, only: [:show, :edit, :update, :destroy]
  before_action :set_datos_basicos, only: [:index, :edit, :new, :create]
  
  # GET /paquete_turisticos
  # GET /paquete_turisticos.json
  def index
    @paquete_turisticos = PaqueteTuristico.all
  end

  # GET /paquete_turisticos/1
  # GET /paquete_turisticos/1.json
  def show
    catalogo = Catalogo.find(@paquete_turistico.pqt_tipo_paquete)
    @tipo_paquete = catalogo.ctlg_valor_desc
  end

  # GET /paquete_turisticos/new
  def new
    @paquete_turistico = PaqueteTuristico.new
  end

  # GET /paquete_turisticos/1/edit
  def edit
  end

  # POST /paquete_turisticos
  # POST /paquete_turisticos.json
  def create
    @paquete_turistico = PaqueteTuristico.new(paquete_turistico_params)

    respond_to do |format|
      if @paquete_turistico.save
        format.html { redirect_to @paquete_turistico, notice: 'Paquete turistico creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @paquete_turistico }
      else
        format.html { render action: 'new' }
        format.json { render json: @paquete_turistico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paquete_turisticos/1
  # PATCH/PUT /paquete_turisticos/1.json
  def update
    respond_to do |format|
      if @paquete_turistico.update(paquete_turistico_params)
        format.html { redirect_to @paquete_turistico, notice: 'Paquete turistico actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paquete_turistico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paquete_turisticos/1
  # DELETE /paquete_turisticos/1.json
  def destroy
    @paquete_turistico.destroy
    respond_to do |format|
      format.html { redirect_to paquete_turisticos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paquete_turistico
      @paquete_turistico = PaqueteTuristico.find(params[:id])
    end
    
    def set_datos_basicos
      @tipos_paquetes_turisticos = Catalogo.select("id codigo, ctlg_valor_desc descripcion").where("ctlg_categoria = 'TIPO DE PAQUETE TURISTICO' AND ctlg_estado_registro = 'A'").order(ctlg_valor_desc: :asc).map{|a| [a.descripcion, a.codigo]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paquete_turistico_params
      params.require(:paquete_turistico).permit(:pqt_nombre, :pqt_tipo_paquete, :pqt_tipo_destino, :pqt_descripcion, :pqt_cobertura_servicios, :pqt_condiciones, :pqt_observacion)
    end
end
