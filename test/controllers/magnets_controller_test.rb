require 'test_helper'

class MagnetsControllerTest < ActionController::TestCase
  setup do
    @magnet = magnets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magnets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magnet" do
    assert_difference('Magnet.count') do
      post :create, magnet: { fridge_id: @magnet.fridge_id, locked_by: @magnet.locked_by, locked_until: @magnet.locked_until, word: @magnet.word, x: @magnet.x, y: @magnet.y }
    end

    assert_redirected_to magnet_path(assigns(:magnet))
  end

  test "should show magnet" do
    get :show, id: @magnet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magnet
    assert_response :success
  end

  test "should update magnet" do
    patch :update, id: @magnet, magnet: { fridge_id: @magnet.fridge_id, locked_by: @magnet.locked_by, locked_until: @magnet.locked_until, word: @magnet.word, x: @magnet.x, y: @magnet.y }
    assert_redirected_to magnet_path(assigns(:magnet))
  end

  test "should destroy magnet" do
    assert_difference('Magnet.count', -1) do
      delete :destroy, id: @magnet
    end

    assert_redirected_to magnets_path
  end
end
