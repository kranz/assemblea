require 'test_helper'

class SezioniControllerTest < ActionController::TestCase
  setup do
    @sezione = sezioni(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sezioni)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sezione" do
    assert_difference('Sezione.count') do
      post :create, sezione: { nome: @sezione.nome }
    end

    assert_redirected_to sezione_path(assigns(:sezione))
  end

  test "should show sezione" do
    get :show, id: @sezione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sezione
    assert_response :success
  end

  test "should update sezione" do
    put :update, id: @sezione, sezione: { nome: @sezione.nome }
    assert_redirected_to sezione_path(assigns(:sezione))
  end

  test "should destroy sezione" do
    assert_difference('Sezione.count', -1) do
      delete :destroy, id: @sezione
    end

    assert_redirected_to sezioni_path
  end
end
