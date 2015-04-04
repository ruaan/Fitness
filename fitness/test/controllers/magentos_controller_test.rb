require "test_helper"

describe MagentosController do

  let(:magento) { magentos :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magentos)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates magento" do
    assert_difference('Magento.count') do
      post :create, magento: { refNumber: magento.refNumber }
    end

    assert_redirected_to magento_path(assigns(:magento))
  end

  it "shows magento" do
    get :show, id: magento
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: magento
    assert_response :success
  end

  it "updates magento" do
    put :update, id: magento, magento: { refNumber: magento.refNumber }
    assert_redirected_to magento_path(assigns(:magento))
  end

  it "destroys magento" do
    assert_difference('Magento.count', -1) do
      delete :destroy, id: magento
    end

    assert_redirected_to magentos_path
  end

end
