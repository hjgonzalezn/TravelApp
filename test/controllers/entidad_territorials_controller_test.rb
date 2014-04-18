require 'test_helper'

class EntidadTerritorialsControllerTest < ActionController::TestCase
  setup do
    @entidad_territorial = entidad_territorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entidad_territorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entidad_territorial" do
    assert_difference('EntidadTerritorial.count') do
      post :create, entidad_territorial: { enter_estado_registro: @entidad_territorial.enter_estado_registro, enter_nivel: @entidad_territorial.enter_nivel, enter_nombre_oficial: @entidad_territorial.enter_nombre_oficial, enter_padre: @entidad_territorial.enter_padre, enter_presentacion: @entidad_territorial.enter_presentacion, region_id: @entidad_territorial.region_id }
    end

    assert_redirected_to entidad_territorial_path(assigns(:entidad_territorial))
  end

  test "should show entidad_territorial" do
    get :show, id: @entidad_territorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entidad_territorial
    assert_response :success
  end

  test "should update entidad_territorial" do
    patch :update, id: @entidad_territorial, entidad_territorial: { enter_estado_registro: @entidad_territorial.enter_estado_registro, enter_nivel: @entidad_territorial.enter_nivel, enter_nombre_oficial: @entidad_territorial.enter_nombre_oficial, enter_padre: @entidad_territorial.enter_padre, enter_presentacion: @entidad_territorial.enter_presentacion, region_id: @entidad_territorial.region_id }
    assert_redirected_to entidad_territorial_path(assigns(:entidad_territorial))
  end

  test "should destroy entidad_territorial" do
    assert_difference('EntidadTerritorial.count', -1) do
      delete :destroy, id: @entidad_territorial
    end

    assert_redirected_to entidad_territorials_path
  end
end
