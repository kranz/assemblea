require 'test_helper'

class AssembleeControllerTest < ActionController::TestCase
  setup do
    @assemblea = assemblee(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assemblee)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assemblea" do
    assert_difference('Assemblea.count') do
      post :create, assemblea: { data: @assemblea.data, eliminato: @assemblea.eliminato, nome: @assemblea.nome, orafine: @assemblea.orafine, orainizio: @assemblea.orainizio, presidente: @assemblea.presidente, stato: @assemblea.stato }
    end

    assert_redirected_to assemblea_path(assigns(:assemblea))
  end

  test "should show assemblea" do
    get :show, id: @assemblea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assemblea
    assert_response :success
  end

  test "should update assemblea" do
    put :update, id: @assemblea, assemblea: { data: @assemblea.data, eliminato: @assemblea.eliminato, nome: @assemblea.nome, orafine: @assemblea.orafine, orainizio: @assemblea.orainizio, presidente: @assemblea.presidente, stato: @assemblea.stato }
    assert_redirected_to assemblea_path(assigns(:assemblea))
  end

  test "should destroy assemblea" do
    assert_difference('Assemblea.count', -1) do
      delete :destroy, id: @assemblea
    end

    assert_redirected_to assemblee_path
  end
end
