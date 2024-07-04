require 'application_system_test_case'

module RushJob
  class DashboardReloadTest < ApplicationSystemTestCase
    self.use_transactional_tests = true

    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
      @no_args_job = rush_job_rush_jobs(:job_no_arguments)
    end

    test 'reload button' do
      visit '/rush_job'

      assert_text 'Test server', count: 2
      assert_text 'Test queue', count: 2

      @rush_job.delete
      @no_args_job.delete

      click_link_or_button 'Reload'

      assert_no_text 'Test server'
      assert_text 'Test queue', count: 1
    end
  end
end
