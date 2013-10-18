require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get wikipedia_gps" do
    get :wikipedia_gps
    assert_response :success
  end

end
