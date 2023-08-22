require 'application_system_test_case'

module RushJob
  class DashboardPaginationTest < ApplicationSystemTestCase
    test 'Locked job pagination does not affect queue pagination' do
      visit '/rush_job'

      assert_text 'Test server'
      assert_text 'JobQueue0'
      within '#rush-job-locked-job-pagination' do
        click_link('Next')
      end

      assert_no_text 'Test server'
      assert_text 'JobQueue0'
    end

    test 'Queue pagination does not affect job pagination' do
      visit '/rush_job'

      assert_text 'Test server'
      assert_text 'JobQueue0'
      within '#rush-job-locked-queue-pagination' do
        click_link('Next')
      end

      assert_text 'Test server'
      assert_no_text 'JobQueue0'
    end
  end
end
