require 'test_helper'

class DivisionTerritorialsControllerTest < ActionController::TestCase
  setup do
    @division_territorial = division_territorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:division_territorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create division_territorial" do
    assert_difference('DivisionTerritorial.count') do
      post :create, division_territorial: { dvt_estado_registro: @division_territorial.dvt_estado_registro, dvt_nombre: @division_territorial.dvt_nombre }
    end

    assert_redirected_to division_territorial_path(assigns(:division_territorial))
  end

  test "should show division_territorial" do
    get :show, id: @division_territorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @division_territorial
    assert_response :success
  end

  test "should update division_territorial" do
    patch :update, id: @division_territorial, division_territorial: { dvt_estado_registro: @division_territorial.dvt_estado_registro, dvt_nombre: @division_territorial.dvt_nombre }
    assert_redirected_to division_territorial_path(assigns(:division_territorial))
  end

  test "should destroy division_territorial" do
    assert_difference('DivisionTerritorial.count', -1) do
      delete :destroy, id: @division_territorial
    end

    assert_redirected_to division_territorials_path
  end
end
