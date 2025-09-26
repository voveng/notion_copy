# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login_url
    assert_response :success
  end

  test 'should create session' do
    user = users(:one)
    post createsession_url, params: { email: user.email, password: 'password' }
    assert_redirected_to root_path
  end
end
