require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  test 'sign up' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Sign up'

    assert page.has_content?('You have signed up successfully')
  end
end
