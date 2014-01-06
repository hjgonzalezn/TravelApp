require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { perfil_id: @usuario.perfil_id, usr_apellidos: @usuario.usr_apellidos, usr_contrasena: @usuario.usr_contrasena, usr_correo_electronico: @usuario.usr_correo_electronico, usr_estado: @usuario.usr_estado, usr_fch_ultimo_ingreso: @usuario.usr_fch_ultimo_ingreso, usr_fch_vigencia_contrasena: @usuario.usr_fch_vigencia_contrasena, usr_fecha_nacimiento: @usuario.usr_fecha_nacimiento, usr_fecha_ultima_salida: @usuario.usr_fecha_ultima_salida, usr_foto: @usuario.usr_foto, usr_genero: @usuario.usr_genero, usr_nombres: @usuario.usr_nombres, usr_nro_docum_ident: @usuario.usr_nro_docum_ident, usr_tipo_cliente: @usuario.usr_tipo_cliente, usr_tipo_contrasena: @usuario.usr_tipo_contrasena, usr_tipo_docum_ident: @usuario.usr_tipo_docum_ident }
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should show usuario" do
    get :show, id: @usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario
    assert_response :success
  end

  test "should update usuario" do
    patch :update, id: @usuario, usuario: { perfil_id: @usuario.perfil_id, usr_apellidos: @usuario.usr_apellidos, usr_contrasena: @usuario.usr_contrasena, usr_correo_electronico: @usuario.usr_correo_electronico, usr_estado: @usuario.usr_estado, usr_fch_ultimo_ingreso: @usuario.usr_fch_ultimo_ingreso, usr_fch_vigencia_contrasena: @usuario.usr_fch_vigencia_contrasena, usr_fecha_nacimiento: @usuario.usr_fecha_nacimiento, usr_fecha_ultima_salida: @usuario.usr_fecha_ultima_salida, usr_foto: @usuario.usr_foto, usr_genero: @usuario.usr_genero, usr_nombres: @usuario.usr_nombres, usr_nro_docum_ident: @usuario.usr_nro_docum_ident, usr_tipo_cliente: @usuario.usr_tipo_cliente, usr_tipo_contrasena: @usuario.usr_tipo_contrasena, usr_tipo_docum_ident: @usuario.usr_tipo_docum_ident }
    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete :destroy, id: @usuario
    end

    assert_redirected_to usuarios_path
  end
end
