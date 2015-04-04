require 'test_helper'
require 'minitest/rails'
class DataControllerTest < ActionController::TestCase
  test "should get dataform" do
    get :dataform
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get generate" do
    get :generate
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get misc" do
    get :misc
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
