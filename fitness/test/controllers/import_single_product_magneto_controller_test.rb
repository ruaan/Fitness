require "test_helper"

describe ImportSingleProductMagnetoController do
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get create" do
    get :create
    assert_response :success
  end

  it "should get import" do
    get :import
    assert_response :success
  end

end
