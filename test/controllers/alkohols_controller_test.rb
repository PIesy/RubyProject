require 'test_helper'

class AlkoholsControllerTest < ActionController::TestCase
  setup do
    @alkohol = alkohols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alkohols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alkohol" do
    assert_difference('Alkohol.count') do
      post :create, alkohol: { bottle_type: @alkohol.bottle_type, image_name: @alkohol.image_name, image_uid: @alkohol.image_uid, name: @alkohol.name, percentage: @alkohol.percentage, volume: @alkohol.volume }
    end

    assert_redirected_to alkohol_path(assigns(:alkohol))
  end

  test "should show alkohol" do
    get :show, id: @alkohol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alkohol
    assert_response :success
  end

  test "should update alkohol" do
    patch :update, id: @alkohol, alkohol: { bottle_type: @alkohol.bottle_type, image_name: @alkohol.image_name, image_uid: @alkohol.image_uid, name: @alkohol.name, percentage: @alkohol.percentage, volume: @alkohol.volume }
    assert_redirected_to alkohol_path(assigns(:alkohol))
  end

  test "should destroy alkohol" do
    assert_difference('Alkohol.count', -1) do
      delete :destroy, id: @alkohol
    end

    assert_redirected_to alkohols_path
  end
end
