# frozen_string_literal: true

require 'test_helper'

class WorkspacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post createsession_url, params: { email: @user.email, password: 'password' }
    @workspace = workspaces(:one)
  end

  test 'should get index' do
    get workspaces_url
    assert_response :success
  end

  test 'should get new' do
    get new_workspace_url
    assert_response :success
  end

  test 'should create workspace' do
    assert_difference('Workspace.count') do
      post workspaces_url, params: { workspace: { title: 'New Workspace' } }
    end

    assert_redirected_to root_url
  end

  test 'should show workspace' do
    get workspace_url(@workspace)
    assert_response :success
  end

  test 'should get edit' do
    get edit_workspace_url(@workspace)
    assert_response :success
  end

  test 'should update workspace' do
    patch workspace_url(@workspace), params: { workspace: { title: 'Updated Workspace' } }
    assert_redirected_to root_path
  end

  test 'should destroy workspace' do
    assert_difference('Workspace.count', -1) do
      delete workspace_url(@workspace)
    end

    assert_redirected_to workspaces_url
  end
end
