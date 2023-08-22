require 'application_system_test_case'

module RushJob
  class DashboardPollingTest < ApplicationSystemTestCase
    self.use_transactional_tests = true

    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
      @no_args_job = rush_job_rush_jobs(:job_no_arguments)
    end

    test 'dashboard polling' do
      visit '/rush_job'

      assert_text 'Test server', count: 2
      assert_text 'Test queue', count: 2

      @rush_job.delete

      find(:xpath, "//input[@id='rush-job-polling-range']").set 0
      find(:xpath, "//input[@id='rush-job-polling']").set true

      assert_text 'Polling time: 3 seconds'
      assert_text 'Test server', count: 1
      assert_text 'Test queue', count: 1

      @no_args_job.delete
      sleep 4

      assert_no_text 'Test server'
      assert_text 'Test queue', count: 1
    end
  end
end
