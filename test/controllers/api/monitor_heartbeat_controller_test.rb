require "test_helper"

class Api::MonitorHeartbeatControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_monitor_heartbeat_create_url
    assert_response :success
  end
end
