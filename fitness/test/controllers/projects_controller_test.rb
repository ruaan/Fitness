require 'test_helper'
require 'minitest/rails'
class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { T: @project.T, customer: @project.customer, description: @project.description, documentType: @project.documentType, followUp: @project.followUp, market: @project.market, name: @project.name, pricelist: @project.pricelist, projectStage: @project.projectStage, startDate: @project.startDate, version: @project.version }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { T: @project.T, customer: @project.customer, description: @project.description, documentType: @project.documentType, followUp: @project.followUp, market: @project.market, name: @project.name, pricelist: @project.pricelist, projectStage: @project.projectStage, startDate: @project.startDate, version: @project.version }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
