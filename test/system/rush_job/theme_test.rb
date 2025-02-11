require 'application_system_test_case'

module RushJob
  class ThemeTest < ApplicationSystemTestCase
    test 'changing modes' do
      visit '/rush_job'

      assert_css 'body[data-bs-theme=light]'

      click_link_or_button 'Options'
      click_link_or_button 'Dark Mode'

      assert_css 'body[data-bs-theme=dark]'
      assert_no_button 'Dark Mode'
      assert_no_css 'body[data-bs-theme=light]'

      click_link_or_button 'Options'

      assert_button 'Light Mode'

      refresh

      assert_css 'body[data-bs-theme=dark]'
      assert_no_button 'Dark Mode'
      assert_no_css 'body[data-bs-theme=light]'

      click_link_or_button 'Options'

      assert_button 'Light Mode'

      click_link_or_button 'Light Mode'

      assert_no_css 'body[data-bs-theme=dark]'

      click_link_or_button 'Options'

      assert_button 'Dark Mode'
      assert_css 'body[data-bs-theme=light]'
      assert_no_button 'Light Mode'
    end
  end
end
