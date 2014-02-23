require 'test_helper'

class FuncionControlsControllerTest < ActionController::TestCase
  setup do
    @funcion_control = funcion_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcion_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcion_control" do
    assert_difference('FuncionControl.count') do
      post :create, funcion_control: { accion_id: @funcion_control.accion_id, control_id: @funcion_control.control_id, funcionalidad_id: @funcion_control.funcionalidad_id, modelo_id: @funcion_control.modelo_id }
    end

    assert_redirected_to funcion_control_path(assigns(:funcion_control))
  end

  test "should show funcion_control" do
    get :show, id: @funcion_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcion_control
    assert_response :success
  end

  test "should update funcion_control" do
    patch :update, id: @funcion_control, funcion_control: { accion_id: @funcion_control.accion_id, control_id: @funcion_control.control_id, funcionalidad_id: @funcion_control.funcionalidad_id, modelo_id: @funcion_control.modelo_id }
    assert_redirected_to funcion_control_path(assigns(:funcion_control))
  end

  test "should destroy funcion_control" do
    assert_difference('FuncionControl.count', -1) do
      delete :destroy, id: @funcion_control
    end

    assert_redirected_to funcion_controls_path
  end
end
