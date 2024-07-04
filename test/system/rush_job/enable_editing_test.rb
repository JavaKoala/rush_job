require 'application_system_test_case'

module RushJob
  class EnableEditingTest < ApplicationSystemTestCase
    test 'changing modes' do
      visit '/rush_job'

      assert_no_button 'Clear'

      click_link_or_button 'Options'
      accept_confirm do
        click_link_or_button 'Enable Editing'
      end

      assert_button 'Clear'

      click_link_or_button 'Options'
      accept_confirm do
        click_link_or_button 'Disable Editing'
      end

      assert_no_button 'Clear'
    end
  end
end
