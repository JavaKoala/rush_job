require 'application_system_test_case'

module RushJob
  class RushJobsReloadTest < ApplicationSystemTestCase
    self.use_transactional_tests = true

    setup do
      @last_job = rush_job_rush_jobs(:last_job)
    end

    test 'reload button' do
      visit '/rush_job/rush_jobs'

      assert_selector '#rush-job-up-arrow'

      click_link 'Id'

      assert_selector '#rush-job-down-arrow'
      assert_text 'Penultimate job error'
      assert_text 'Last job error'

      @last_job.delete
      click_button 'Reload'

      assert_selector '#rush-job-down-arrow'
      assert_text 'Penultimate job error'
      assert_no_text 'Last job error'
    end
  end
end
