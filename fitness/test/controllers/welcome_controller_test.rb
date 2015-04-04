require 'test_helper'
require 'minitest/rails'
class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
