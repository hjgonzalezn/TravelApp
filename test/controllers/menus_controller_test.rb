require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post :create, menu: { accion_id: @menu.accion_id, mnu_clase_css: @menu.mnu_clase_css, mnu_etiqueta_html: @menu.mnu_etiqueta_html, mnu_orden: @menu.mnu_orden, mnu_padre: @menu.mnu_padre, mnu_props_html: @menu.mnu_props_html, mnu_texto: @menu.mnu_texto, mnu_tipo_elemento: @menu.mnu_tipo_elemento, modelo_id: @menu.modelo_id }
    end

    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should show menu" do
    get :show, id: @menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu
    assert_response :success
  end

  test "should update menu" do
    patch :update, id: @menu, menu: { accion_id: @menu.accion_id, mnu_clase_css: @menu.mnu_clase_css, mnu_etiqueta_html: @menu.mnu_etiqueta_html, mnu_orden: @menu.mnu_orden, mnu_padre: @menu.mnu_padre, mnu_props_html: @menu.mnu_props_html, mnu_texto: @menu.mnu_texto, mnu_tipo_elemento: @menu.mnu_tipo_elemento, modelo_id: @menu.modelo_id }
    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete :destroy, id: @menu
    end

    assert_redirected_to menus_path
  end
end
