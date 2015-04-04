require "test_helper"

describe SoapsController do

  let(:soap) { soaps :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soaps)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates soap" do
    assert_difference('Soap.count') do
      post :create, soap: { name: soap.name }
    end

    assert_redirected_to soap_path(assigns(:soap))
  end

  it "shows soap" do
    get :show, id: soap
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: soap
    assert_response :success
  end

  it "updates soap" do
    put :update, id: soap, soap: { name: soap.name }
    assert_redirected_to soap_path(assigns(:soap))
  end

  it "destroys soap" do
    assert_difference('Soap.count', -1) do
      delete :destroy, id: soap
    end

    assert_redirected_to soaps_path
  end

end
