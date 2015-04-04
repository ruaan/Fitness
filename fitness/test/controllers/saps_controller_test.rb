require "test_helper"

describe SapsController do

  let(:sap) { saps :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saps)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates sap" do
    assert_difference('Sap.count') do
      post :create, sap: { name: sap.name }
    end

    assert_redirected_to sap_path(assigns(:sap))
  end

  it "shows sap" do
    get :show, id: sap
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: sap
    assert_response :success
  end

  it "updates sap" do
    put :update, id: sap, sap: { name: sap.name }
    assert_redirected_to sap_path(assigns(:sap))
  end

  it "destroys sap" do
    assert_difference('Sap.count', -1) do
      delete :destroy, id: sap
    end

    assert_redirected_to saps_path
  end

end
