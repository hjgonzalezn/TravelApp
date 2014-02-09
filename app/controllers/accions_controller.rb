class AccionsController < ApplicationController
  before_action :set_accion, only: [:show, :edit, :update, :destroy]

  # GET /accions
  # GET /accions.json
  def index
    @accions = Accion.all
  end

  # GET /accions/1
  # GET /accions/1.json
  def show
  end

  # GET /accions/new
  def new
    @accion = Accion.new
  end

  # GET /accions/1/edit
  def edit
  end

  # POST /accions
  # POST /accions.json
  def create
    @accion = Accion.new(accion_params)

    respond_to do |format|
      if @accion.save
        format.html { redirect_to @accion, notice: 'Accion creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @accion }
      else
        format.html { render action: 'new' }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accions/1
  # PATCH/PUT /accions/1.json
  def update
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to @accion, notice: 'Accion actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accions/1
  # DELETE /accions/1.json
  def destroy
    @accion.destroy
    respond_to do |format|
      format.html { redirect_to accions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accion
      @accion = Accion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accion_params
      params.require(:accion).permit(:acc_codigo, :acc_nombre, :acc_estado_registro)
    end
end
