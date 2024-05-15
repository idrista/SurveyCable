require "test_helper"

class JoinControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get join_show_url
    assert_response :success
  end

  test "should get create_user" do
    get join_create_user_url
    assert_response :success
  end
end
