class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @perfiles = Perfil.where("prf_estado_registro = 'A'")
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @tipos_id = Catalogo.where("ctlg_categoria = 'TIPO DE DOCUMENTO DE IDENTIDAD' AND ctlg_estado_registro = 'A'").order(ctlg_valor_desc: :asc)
    @generos = Catalogo.where("ctlg_categoria = 'GENERO' AND ctlg_estado_registro = 'A'")
    @estados = Catalogo.where("ctlg_categoria = 'ESTADO REGISTRO' AND ctlg_estado_registro = 'A'")
    @perfiles = Perfil.where("prf_estado_registro = 'A'")
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.new
    @tipos_id = Catalogo.where("ctlg_categoria = 'TIPO DE DOCUMENTO DE IDENTIDAD' AND ctlg_estado_registro = 'A'").order(ctlg_valor_desc: :asc)
    @generos = Catalogo.where("ctlg_categoria = 'GENERO' AND ctlg_estado_registro = 'A'")
    @estados = Catalogo.where("ctlg_categoria = 'ESTADO REGISTRO' AND ctlg_estado_registro = 'A'")
    @perfiles = Perfil.where("prf_estado_registro = 'A'")
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:usr_tipo_docum_ident, :usr_nro_docum_ident, :usr_nombres, :usr_apellidos, :usr_correo_electronico, :usr_contrasena, :usr_tipo_contrasena, :usr_fecha_nacimiento, :usr_genero, :usr_foto, :usr_fch_ultimo_ingreso, :usr_tipo_cliente, :usr_fecha_ultima_salida, :usr_fch_vigencia_contrasena, :usr_estado, :perfil_id)
    end
end
