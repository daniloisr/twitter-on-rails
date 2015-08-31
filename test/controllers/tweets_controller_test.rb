require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'redirects to login page ' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should get index' do
    sign_in users(:one)
    get :index
    assert_response :success
  end
end
