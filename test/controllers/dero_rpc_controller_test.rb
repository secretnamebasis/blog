require "test_helper"

class DeroRpcControllerTest < ActionDispatch::IntegrationTest
  test "should get initialize" do
    get dero_rpc_initialize_url
    assert_response :success
  end

  test "should get send_request" do
    get dero_rpc_send_request_url
    assert_response :success
  end
end
