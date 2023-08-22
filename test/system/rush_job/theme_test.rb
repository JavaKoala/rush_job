require 'application_system_test_case'

module RushJob
  class ThemeTest < ApplicationSystemTestCase
    test 'changing modes' do
      visit '/rush_job'

      assert_css '.background-color-light'

      click_link 'Dark Mode'

      assert_css '.background-color-dark'
      assert_no_link 'Dark Mode'
      assert_no_css '.background-color-light'
      assert_link 'Light Mode'

      refresh

      assert_css '.background-color-dark'
      assert_no_link 'Dark Mode'
      assert_no_css '.background-color-light'
      assert_link 'Light Mode'

      click_link 'Light Mode'

      assert_no_css '.background-color-dark'
      assert_link 'Dark Mode'
      assert_css '.background-color-light'
      assert_no_link 'Light Mode'
    end
  end
end
