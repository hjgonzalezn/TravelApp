require 'test_helper'

class PaqueteTuristicosControllerTest < ActionController::TestCase
  setup do
    @paquete_turistico = paquete_turisticos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paquete_turisticos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paquete_turistico" do
    assert_difference('PaqueteTuristico.count') do
      post :create, paquete_turistico: { pqt_cobertura_servicios: @paquete_turistico.pqt_cobertura_servicios, pqt_condiciones: @paquete_turistico.pqt_condiciones, pqt_descripcion: @paquete_turistico.pqt_descripcion, pqt_nombre: @paquete_turistico.pqt_nombre, pqt_observacion: @paquete_turistico.pqt_observacion, pqt_tipo_destino: @paquete_turistico.pqt_tipo_destino, pqt_tipo_paquete: @paquete_turistico.pqt_tipo_paquete }
    end

    assert_redirected_to paquete_turistico_path(assigns(:paquete_turistico))
  end

  test "should show paquete_turistico" do
    get :show, id: @paquete_turistico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paquete_turistico
    assert_response :success
  end

  test "should update paquete_turistico" do
    patch :update, id: @paquete_turistico, paquete_turistico: { pqt_cobertura_servicios: @paquete_turistico.pqt_cobertura_servicios, pqt_condiciones: @paquete_turistico.pqt_condiciones, pqt_descripcion: @paquete_turistico.pqt_descripcion, pqt_nombre: @paquete_turistico.pqt_nombre, pqt_observacion: @paquete_turistico.pqt_observacion, pqt_tipo_destino: @paquete_turistico.pqt_tipo_destino, pqt_tipo_paquete: @paquete_turistico.pqt_tipo_paquete }
    assert_redirected_to paquete_turistico_path(assigns(:paquete_turistico))
  end

  test "should destroy paquete_turistico" do
    assert_difference('PaqueteTuristico.count', -1) do
      delete :destroy, id: @paquete_turistico
    end

    assert_redirected_to paquete_turisticos_path
  end
end
