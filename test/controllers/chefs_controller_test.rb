require "test_helper"

class ChefsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chefs_show_url
    assert_response :success
  end

  test "should get new" do
    get chefs_new_url
    assert_response :success
  end

  test "should get edit" do
    get chefs_edit_url
    assert_response :success
  end
end
