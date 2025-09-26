# frozen_string_literal: true

require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sign_up_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post create_user_url,
           params: { user: { email: 'new@example.com', password: 'password', password_confirmation: 'password' } }
    end

    assert_redirected_to root_path
  end
end
