require 'test_helper'

class PresenzeControllerTest < ActionController::TestCase
  setup do
    @presenza = presenze(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presenze)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presenza" do
    assert_difference('Presenza.count') do
      post :create, presenza: { assemblea_id: @presenza.assemblea_id, delegato: @presenza.delegato, presente: @presenza.presente, socio_id: @presenza.socio_id }
    end

    assert_redirected_to presenza_path(assigns(:presenza))
  end

  test "should show presenza" do
    get :show, id: @presenza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presenza
    assert_response :success
  end

  test "should update presenza" do
    put :update, id: @presenza, presenza: { assemblea_id: @presenza.assemblea_id, delegato: @presenza.delegato, presente: @presenza.presente, socio_id: @presenza.socio_id }
    assert_redirected_to presenza_path(assigns(:presenza))
  end

  test "should destroy presenza" do
    assert_difference('Presenza.count', -1) do
      delete :destroy, id: @presenza
    end

    assert_redirected_to presenze_path
  end
end
