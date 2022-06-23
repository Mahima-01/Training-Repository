require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get demo_Index_url
    assert_response :success
  end
end
