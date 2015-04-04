require "test_helper"

describe MagentopushesController do

  let(:magentopush) { magentopushes :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magentopushes)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates magentopush" do
    assert_difference('Magentopush.count') do
      post :create, magentopush: {  }
    end

    assert_redirected_to magentopush_path(assigns(:magentopush))
  end

  it "shows magentopush" do
    get :show, id: magentopush
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: magentopush
    assert_response :success
  end

  it "updates magentopush" do
    put :update, id: magentopush, magentopush: {  }
    assert_redirected_to magentopush_path(assigns(:magentopush))
  end

  it "destroys magentopush" do
    assert_difference('Magentopush.count', -1) do
      delete :destroy, id: magentopush
    end

    assert_redirected_to magentopushes_path
  end

end
