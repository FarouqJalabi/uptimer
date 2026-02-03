require "test_helper"

class Monitor::FetchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitor_fetch = monitor_fetches(:one)
  end

  test "should get index" do
    get monitor_fetches_url
    assert_response :success
  end

  test "should get new" do
    get new_monitor_fetch_url
    assert_response :success
  end

  test "should create monitor_fetch" do
    assert_difference("Monitor::Fetch.count") do
      post monitor_fetches_url, params: { monitor_fetch: {} }
    end

    assert_redirected_to monitor_fetch_url(Monitor::Fetch.last)
  end

  test "should show monitor_fetch" do
    get monitor_fetch_url(@monitor_fetch)
    assert_response :success
  end

  test "should get edit" do
    get edit_monitor_fetch_url(@monitor_fetch)
    assert_response :success
  end

  test "should update monitor_fetch" do
    patch monitor_fetch_url(@monitor_fetch), params: { monitor_fetch: {} }
    assert_redirected_to monitor_fetch_url(@monitor_fetch)
  end

  test "should destroy monitor_fetch" do
    assert_difference("Monitor::Fetch.count", -1) do
      delete monitor_fetch_url(@monitor_fetch)
    end

    assert_redirected_to monitor_fetches_url
  end
end
