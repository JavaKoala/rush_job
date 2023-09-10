require 'application_system_test_case'

module RushJob
  class DashboardClearQueueTest < ApplicationSystemTestCase
    self.use_transactional_tests = true

    test 'clear queue' do
      visit '/rush_job'

      assert_text 'JobQueue0'

      click_link 'Options'
      accept_confirm do
        click_button 'Enable Editing'
      end

      assert_difference 'RushJob.queue_groups.count', -1 do
        accept_confirm do
          click_button('Clear', match: :first)
        end

        assert_text 'Cleared queue JobQueue0'

        click_button 'Reload'
      end

      assert_no_text 'JobQueue0'
    end
  end
end
