require 'test_helper'

class BogglesControllerTest < ActionDispatch::IntegrationTest
  test "should get current_board" do
    get boggles_current_board_url
    assert_response :success
  end

end
