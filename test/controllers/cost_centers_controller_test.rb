require 'test_helper'

class CostCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_center = cost_centers(:one)
  end

  test "should get index" do
    get cost_centers_url, as: :json
    assert_response :success
  end

  test "should create cost_center" do
    assert_difference('CostCenter.count') do
      post cost_centers_url, params: { cost_center: { name: @cost_center.name } }, as: :json
    end

    assert_response 201
  end

  test "should show cost_center" do
    get cost_center_url(@cost_center), as: :json
    assert_response :success
  end

  test "should update cost_center" do
    patch cost_center_url(@cost_center), params: { cost_center: { name: @cost_center.name } }, as: :json
    assert_response 200
  end

  test "should destroy cost_center" do
    assert_difference('CostCenter.count', -1) do
      delete cost_center_url(@cost_center), as: :json
    end

    assert_response 204
  end
end
