require 'test_helper'

class FinishingsControllerTest < ActionController::TestCase
  setup do
    @finishing = finishings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finishings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finishing" do
    assert_difference('Finishing.count') do
      post :create, finishing: { name: @finishing.name }
    end

    assert_redirected_to finishing_path(assigns(:finishing))
  end

  test "should show finishing" do
    get :show, id: @finishing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finishing
    assert_response :success
  end

  test "should update finishing" do
    put :update, id: @finishing, finishing: { name: @finishing.name }
    assert_redirected_to finishing_path(assigns(:finishing))
  end

  test "should destroy finishing" do
    assert_difference('Finishing.count', -1) do
      delete :destroy, id: @finishing
    end

    assert_redirected_to finishings_path
  end
end
