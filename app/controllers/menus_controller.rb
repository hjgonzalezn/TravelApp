class MenusController < ApplicationController
  include ApplicationHelper
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_datos_basicos, only: [:new, :edit]
  
  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all.order(id: :asc)
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Elemento de menu creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
    
    def set_datos_basicos
      @modelos = set_modelos
      @acciones = set_acciones
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:mnu_tipo_elemento, :mnu_etiqueta_html, :mnu_clase_css, :mnu_props_html, :mnu_texto, :mnu_padre, :mnu_orden, :modelo_id, :accion_id)
    end
end
