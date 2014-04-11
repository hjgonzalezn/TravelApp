require 'test_helper'

class ParametroSistemasControllerTest < ActionController::TestCase
  setup do
    @parametro_sistema = parametro_sistemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametro_sistemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametro_sistema" do
    assert_difference('ParametroSistema.count') do
      post :create, parametro_sistema: { psis_categoria: @parametro_sistema.psis_categoria, psis_codigo: @parametro_sistema.psis_codigo, psis_descripcion: @parametro_sistema.psis_descripcion, psis_estado_registro: @parametro_sistema.psis_estado_registro, psis_valor: @parametro_sistema.psis_valor }
    end

    assert_redirected_to parametro_sistema_path(assigns(:parametro_sistema))
  end

  test "should show parametro_sistema" do
    get :show, id: @parametro_sistema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parametro_sistema
    assert_response :success
  end

  test "should update parametro_sistema" do
    patch :update, id: @parametro_sistema, parametro_sistema: { psis_categoria: @parametro_sistema.psis_categoria, psis_codigo: @parametro_sistema.psis_codigo, psis_descripcion: @parametro_sistema.psis_descripcion, psis_estado_registro: @parametro_sistema.psis_estado_registro, psis_valor: @parametro_sistema.psis_valor }
    assert_redirected_to parametro_sistema_path(assigns(:parametro_sistema))
  end

  test "should destroy parametro_sistema" do
    assert_difference('ParametroSistema.count', -1) do
      delete :destroy, id: @parametro_sistema
    end

    assert_redirected_to parametro_sistemas_path
  end
end
