require 'test_helper'

class UserPreferencesControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
