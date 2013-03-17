require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post :create, unit: { buyer_id: @unit.buyer_id, finishing_id: @unit.finishing_id, number: @unit.number, seller_id: @unit.seller_id, total_cost: @unit.total_cost, tower_id: @unit.tower_id }
    end

    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should show unit" do
    get :show, id: @unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit
    assert_response :success
  end

  test "should update unit" do
    put :update, id: @unit, unit: { buyer_id: @unit.buyer_id, finishing_id: @unit.finishing_id, number: @unit.number, seller_id: @unit.seller_id, total_cost: @unit.total_cost, tower_id: @unit.tower_id }
    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete :destroy, id: @unit
    end

    assert_redirected_to units_path
  end
end
