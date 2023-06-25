require 'test_helper'

module RushJob
  class RushJobsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
      @routes = Engine.routes
    end

    test 'should get index' do
      get '/rush_job'

      assert_response :success
    end

    test 'should display delayed jobs' do
      get '/rush_job'

      assert_select 'td:nth-child(1)', @rush_job.id.to_s
      assert_select 'td:nth-child(2)', @rush_job.priority.to_s
      assert_select 'td:nth-child(3)', @rush_job.attempts.to_s
      assert_select 'td:nth-child(4)', @rush_job.job_class
      assert_select 'td:nth-child(5)', @rush_job.job_arguments.to_s
      assert_select 'td:nth-child(6)', @rush_job.last_error
      assert_select 'td:nth-child(7)', @rush_job.run_at.to_s
      assert_select 'td:nth-child(8)', @rush_job.locked_at.to_s
      assert_select 'td:nth-child(9)', @rush_job.failed_at.to_s
      assert_select 'td:nth-child(10)', @rush_job.locked_by
      assert_select 'td:nth-child(11)', @rush_job.queue
    end
  end
end
