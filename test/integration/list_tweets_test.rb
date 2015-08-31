require 'test_helper'

class ListTweetsTest < ActionDispatch::IntegrationTest
  test 'Shows tweets' do
    sign_in users(:one)
    visit root_path

    assert_page_has_content 'Fake Tweet =)'
  end
end
