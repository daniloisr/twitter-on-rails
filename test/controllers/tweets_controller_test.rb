require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'should redirects guest users to login page' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should get index' do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test 'should get handle latest tweets' do
    sign_in users(:one)
    get :index, handle: 'user'
    assert assigns['tweets'].count, 1
  end

  test 'should render custom views when "user is not found"' do
    sign_in users(:one)
    get :index, handle: 'not-exists'
    assert_template :user_not_found
  end
end
