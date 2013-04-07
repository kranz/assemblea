require 'test_helper'

class SociControllerTest < ActionController::TestCase
  setup do
    @socio = soci(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soci)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create socio" do
    assert_difference('Socio.count') do
      post :create, socio: { codsocio: @socio.codsocio, codtessera: @socio.codtessera, datanascita: @socio.datanascita, sezione: @socio.sezione, socio: @socio.socio }
    end

    assert_redirected_to socio_path(assigns(:socio))
  end

  test "should show socio" do
    get :show, id: @socio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @socio
    assert_response :success
  end

  test "should update socio" do
    put :update, id: @socio, socio: { codsocio: @socio.codsocio, codtessera: @socio.codtessera, datanascita: @socio.datanascita, sezione: @socio.sezione, socio: @socio.socio }
    assert_redirected_to socio_path(assigns(:socio))
  end

  test "should destroy socio" do
    assert_difference('Socio.count', -1) do
      delete :destroy, id: @socio
    end

    assert_redirected_to soci_path
  end
end
