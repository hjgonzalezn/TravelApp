require 'test_helper'

class DivisionTerritorialPaisControllerTest < ActionController::TestCase
  setup do
    @division_territorial_pai = division_territorial_pais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:division_territorial_pais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create division_territorial_pai" do
    assert_difference('DivisionTerritorialPai.count') do
      post :create, division_territorial_pai: { division_territorial_id: @division_territorial_pai.division_territorial_id, dte_estado_registro: @division_territorial_pai.dte_estado_registro, dte_nivel: @division_territorial_pai.dte_nivel, entidad_territorial_id: @division_territorial_pai.entidad_territorial_id }
    end

    assert_redirected_to division_territorial_pai_path(assigns(:division_territorial_pai))
  end

  test "should show division_territorial_pai" do
    get :show, id: @division_territorial_pai
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @division_territorial_pai
    assert_response :success
  end

  test "should update division_territorial_pai" do
    patch :update, id: @division_territorial_pai, division_territorial_pai: { division_territorial_id: @division_territorial_pai.division_territorial_id, dte_estado_registro: @division_territorial_pai.dte_estado_registro, dte_nivel: @division_territorial_pai.dte_nivel, entidad_territorial_id: @division_territorial_pai.entidad_territorial_id }
    assert_redirected_to division_territorial_pai_path(assigns(:division_territorial_pai))
  end

  test "should destroy division_territorial_pai" do
    assert_difference('DivisionTerritorialPai.count', -1) do
      delete :destroy, id: @division_territorial_pai
    end

    assert_redirected_to division_territorial_pais_path
  end
end
