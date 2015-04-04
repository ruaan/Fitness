require "test_helper"

describe SappushesController do

  let(:sappush) { sappushes :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sappushes)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates sappush" do
    assert_difference('Sappush.count') do
      post :create, sappush: { name: sappush.name }
    end

    assert_redirected_to sappush_path(assigns(:sappush))
  end

  it "shows sappush" do
    get :show, id: sappush
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: sappush
    assert_response :success
  end

  it "updates sappush" do
    put :update, id: sappush, sappush: { name: sappush.name }
    assert_redirected_to sappush_path(assigns(:sappush))
  end

  it "destroys sappush" do
    assert_difference('Sappush.count', -1) do
      delete :destroy, id: sappush
    end

    assert_redirected_to sappushes_path
  end

end
