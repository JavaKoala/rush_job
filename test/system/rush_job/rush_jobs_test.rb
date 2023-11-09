require 'application_system_test_case'

module RushJob
  class RushJobsTest < ApplicationSystemTestCase
    test 'visiting the index' do
      visit '/rush_job/rush_jobs'
      assert_selector '#rush-job-jobs'
    end

    test 'displays pagination' do
      visit '/rush_job/rush_jobs'
      assert_css '.pagination'
    end

    test 'sorting' do
      visit '/rush_job/rush_jobs'
      assert_text 'Test queue'

      click_link 'Queue'
      assert_selector '#rush-job-up-arrow'
      assert_no_text 'Test queue'
      assert_text 'JobQueue'

      click_link 'Next'
      assert_text 'Test queue'

      click_link 'Queue'
      assert_selector '#rush-job-down-arrow'
      assert_text 'Test queue'
    end

    test 'invalid page number' do
      visit '/rush_job/rush_jobs?page=100'

      assert_current_path '/rush_job/rush_jobs'
      assert_text 'No jobs on that page, redirected to first page.'

      click_button 'Reload'
      assert_no_text 'No jobs on that page, redirected to first page.'
    end
  end
end
