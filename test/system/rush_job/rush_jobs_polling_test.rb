require 'application_system_test_case'

module RushJob
  class RushJobsPollingTest < ApplicationSystemTestCase
    self.use_transactional_tests = true

    setup do
      @last_job = rush_job_rush_jobs(:last_job)
      @penultimate_job = rush_job_rush_jobs(:penultimate_job)
    end

    test 'reload button' do
      visit '/rush_job'

      click_link 'Id'
      assert_text 'Last job error'
      assert_text 'Penultimate job error'
      assert_text 'Polling time: 13 seconds'

      @penultimate_job.delete

      find(:xpath, "//input[@id='rush-job-polling-range']").set 0
      find(:xpath, "//input[@id='rush-job-polling']").set true

      assert_text 'Polling time: 3 seconds'
      assert_no_text 'Penultimate job error'

      @last_job.delete
      sleep 4

      assert_no_text 'Last job error'
    end
  end
end
