require 'test_helper'

class DatoEntidadsControllerTest < ActionController::TestCase
  setup do
    @dato_entidad = dato_entidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dato_entidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dato_entidad" do
    assert_difference('DatoEntidad.count') do
      post :create, dato_entidad: { ent_dato_categoria: @dato_entidad.ent_dato_categoria, ent_dato_codigo: @dato_entidad.ent_dato_codigo, ent_dato_descripcion: @dato_entidad.ent_dato_descripcion, ent_dato_estado_registro: @dato_entidad.ent_dato_estado_registro, ent_dato_valor: @dato_entidad.ent_dato_valor }
    end

    assert_redirected_to dato_entidad_path(assigns(:dato_entidad))
  end

  test "should show dato_entidad" do
    get :show, id: @dato_entidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dato_entidad
    assert_response :success
  end

  test "should update dato_entidad" do
    patch :update, id: @dato_entidad, dato_entidad: { ent_dato_categoria: @dato_entidad.ent_dato_categoria, ent_dato_codigo: @dato_entidad.ent_dato_codigo, ent_dato_descripcion: @dato_entidad.ent_dato_descripcion, ent_dato_estado_registro: @dato_entidad.ent_dato_estado_registro, ent_dato_valor: @dato_entidad.ent_dato_valor }
    assert_redirected_to dato_entidad_path(assigns(:dato_entidad))
  end

  test "should destroy dato_entidad" do
    assert_difference('DatoEntidad.count', -1) do
      delete :destroy, id: @dato_entidad
    end

    assert_redirected_to dato_entidads_path
  end
end
