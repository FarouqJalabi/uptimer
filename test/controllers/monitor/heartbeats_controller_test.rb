require "test_helper"

class Monitor::HeartbeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitor_heartbeat = monitor_heartbeats(:one)
  end

  test "should get index" do
    get monitor_heartbeats_url
    assert_response :success
  end

  test "should get new" do
    get new_monitor_heartbeat_url
    assert_response :success
  end

  test "should create monitor_heartbeat" do
    assert_difference("Monitor::Heartbeat.count") do
      post monitor_heartbeats_url, params: { monitor_heartbeat: {} }
    end

    assert_redirected_to monitor_heartbeat_url(Monitor::Heartbeat.last)
  end

  test "should show monitor_heartbeat" do
    get monitor_heartbeat_url(@monitor_heartbeat)
    assert_response :success
  end

  test "should get edit" do
    get edit_monitor_heartbeat_url(@monitor_heartbeat)
    assert_response :success
  end

  test "should update monitor_heartbeat" do
    patch monitor_heartbeat_url(@monitor_heartbeat), params: { monitor_heartbeat: {} }
    assert_redirected_to monitor_heartbeat_url(@monitor_heartbeat)
  end

  test "should destroy monitor_heartbeat" do
    assert_difference("Monitor::Heartbeat.count", -1) do
      delete monitor_heartbeat_url(@monitor_heartbeat)
    end

    assert_redirected_to monitor_heartbeats_url
  end
end
