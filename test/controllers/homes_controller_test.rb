require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get を実行。" do
    get homes_を実行。_url
    assert_response :success
  end
end
