require 'test_helper'

class Api::V1::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_project = api_v1_projects(:one)
  end

  test "should get index" do
    get api_v1_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_project_url
    assert_response :success
  end

  test "should create api_v1_project" do
    assert_difference('Api::V1::Project.count') do
      post api_v1_projects_url, params: { api_v1_project: {  } }
    end

    assert_redirected_to api_v1_project_url(Api::V1::Project.last)
  end

  test "should show api_v1_project" do
    get api_v1_project_url(@api_v1_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_project_url(@api_v1_project)
    assert_response :success
  end

  test "should update api_v1_project" do
    patch api_v1_project_url(@api_v1_project), params: { api_v1_project: {  } }
    assert_redirected_to api_v1_project_url(@api_v1_project)
  end

  test "should destroy api_v1_project" do
    assert_difference('Api::V1::Project.count', -1) do
      delete api_v1_project_url(@api_v1_project)
    end

    assert_redirected_to api_v1_projects_url
  end
end
