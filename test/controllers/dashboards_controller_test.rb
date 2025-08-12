require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get dashboards_user_url
    assert_response :success
  end

  test "should get developer" do
    get dashboards_developer_url
    assert_response :success
  end

  test "should get qa" do
    get dashboards_qa_url
    assert_response :success
  end

  test "should get admin" do
    get dashboards_admin_url
    assert_response :success
  end
end
