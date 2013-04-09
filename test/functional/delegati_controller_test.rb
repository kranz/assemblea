require 'test_helper'

class DelegatiControllerTest < ActionController::TestCase
  setup do
    @delegato = delegati(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delegati)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delegato" do
    assert_difference('Delegato.count') do
      post :create, delegato: { codsocio: @delegato.codsocio, codtessera: @delegato.codtessera, datanascita: @delegato.datanascita, sezione: @delegato.sezione, socio: @delegato.socio }
    end

    assert_redirected_to delegato_path(assigns(:delegato))
  end

  test "should show delegato" do
    get :show, id: @delegato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delegato
    assert_response :success
  end

  test "should update delegato" do
    put :update, id: @delegato, delegato: { codsocio: @delegato.codsocio, codtessera: @delegato.codtessera, datanascita: @delegato.datanascita, sezione: @delegato.sezione, socio: @delegato.socio }
    assert_redirected_to delegato_path(assigns(:delegato))
  end

  test "should destroy delegato" do
    assert_difference('Delegato.count', -1) do
      delete :destroy, id: @delegato
    end

    assert_redirected_to delegati_path
  end
end
