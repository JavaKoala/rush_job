require 'application_system_test_case'

module RushJob
  class ThemeTest < ApplicationSystemTestCase
    test 'changing modes' do
      visit '/rush_job'

      assert_css '.background-color-light'

      click_button 'Dark Mode'

      assert_css '.background-color-dark'
      assert_no_button 'Dark Mode'
      assert_no_css '.background-color-light'
      assert_button 'Light Mode'

      refresh

      assert_css '.background-color-dark'
      assert_no_button 'Dark Mode'
      assert_no_css '.background-color-light'
      assert_button 'Light Mode'

      click_button 'Light Mode'

      assert_no_css '.background-color-dark'
      assert_button 'Dark Mode'
      assert_css '.background-color-light'
      assert_no_button 'Light Mode'
    end
  end
end
