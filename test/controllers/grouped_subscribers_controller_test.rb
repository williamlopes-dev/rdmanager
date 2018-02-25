require 'test_helper'

class GroupedSubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get managers" do
    get grouped_subscribers_managers_url
    assert_response :success
  end

  test "should get payers" do
    get grouped_subscribers_payers_url
    assert_response :success
  end

end
