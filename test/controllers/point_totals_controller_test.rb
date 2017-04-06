require 'test_helper'

class PointTotalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_total = point_totals(:one)
  end

  test "should get index" do
    get point_totals_url
    assert_response :success
  end

  test "should get new" do
    get new_point_total_url
    assert_response :success
  end

  test "should create point_total" do
    assert_difference('PointTotal.count') do
      post point_totals_url, params: { point_total: { absent: @point_total.absent, date: @point_total.date, score: @point_total.score } }
    end

    assert_redirected_to point_total_url(PointTotal.last)
  end

  test "should show point_total" do
    get point_total_url(@point_total)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_total_url(@point_total)
    assert_response :success
  end

  test "should update point_total" do
    patch point_total_url(@point_total), params: { point_total: { absent: @point_total.absent, date: @point_total.date, score: @point_total.score } }
    assert_redirected_to point_total_url(@point_total)
  end

  test "should destroy point_total" do
    assert_difference('PointTotal.count', -1) do
      delete point_total_url(@point_total)
    end

    assert_redirected_to point_totals_url
  end
end
