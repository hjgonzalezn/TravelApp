class DivisionTerritorialsController < ApplicationController
  before_action :set_division_territorial, only: [:show, :edit, :update, :destroy]
  before_action :set_datos_basicos, only: [:new, :create, :edit, :update]
  
  # GET /division_territorials
  # GET /division_territorials.json
  def index
    @division_territorials = DivisionTerritorial.all
  end

  # GET /division_territorials/1
  # GET /division_territorials/1.json
  def show
  end

  # GET /division_territorials/new
  def new
    @division_territorial = DivisionTerritorial.new
  end

  # GET /division_territorials/1/edit
  def edit
  end

  # POST /division_territorials
  # POST /division_territorials.json
  def create
    @division_territorial = DivisionTerritorial.new(division_territorial_params)

    respond_to do |format|
      if @division_territorial.save
        format.html { redirect_to @division_territorial, notice: 'Division territorial creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @division_territorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @division_territorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /division_territorials/1
  # PATCH/PUT /division_territorials/1.json
  def update
    respond_to do |format|
      if @division_territorial.update(division_territorial_params)
        format.html { redirect_to @division_territorial, notice: 'Division territorial actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @division_territorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /division_territorials/1
  # DELETE /division_territorials/1.json
  def destroy
    @division_territorial.destroy
    respond_to do |format|
      format.html { redirect_to division_territorials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division_territorial
      @division_territorial = DivisionTerritorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def division_territorial_params
      params.require(:division_territorial).permit(:dvt_nombre, :dvt_estado_registro)
    end
end
