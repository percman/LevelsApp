require 'test_helper'

class HomeroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homeroom = homerooms(:one)
  end

  test "should get index" do
    get homerooms_url
    assert_response :success
  end

  test "should get new" do
    get new_homeroom_url
    assert_response :success
  end

  test "should create homeroom" do
    assert_difference('Homeroom.count') do
      post homerooms_url, params: { homeroom: { name: @homeroom.name } }
    end

    assert_redirected_to homeroom_url(Homeroom.last)
  end

  test "should show homeroom" do
    get homeroom_url(@homeroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_homeroom_url(@homeroom)
    assert_response :success
  end

  test "should update homeroom" do
    patch homeroom_url(@homeroom), params: { homeroom: { name: @homeroom.name } }
    assert_redirected_to homeroom_url(@homeroom)
  end

  test "should destroy homeroom" do
    assert_difference('Homeroom.count', -1) do
      delete homeroom_url(@homeroom)
    end

    assert_redirected_to homerooms_url
  end
end
