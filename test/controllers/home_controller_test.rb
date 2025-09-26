# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post createsession_url, params: { email: @user.email, password: 'password' }
  end

  test 'should get index' do
    get home_url
    assert_response :success
  end
end
