require 'test_helper'

module RushJob
  class DashboardControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    self.use_transactional_tests = true

    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
    end

    test 'should get index' do
      get '/rush_job/'

      assert_response :success
    end

    test 'should display locked jobs' do
      get '/rush_job/'

      assert_select '#rush-job-dashboard-locked-jobs' do
        assert_select 'th:nth-child(1)', 'Id'
        assert_select 'th:nth-child(2)', 'Locked at'
        assert_select 'th:nth-child(3)', 'Locked by'
        assert_select 'th:nth-child(4)', 'Job class'
        assert_select 'th:nth-child(5)', 'Arguments'

        assert_select 'tr:nth-child(1)' do
          assert_select 'td:nth-child(1)', @rush_job.id
          assert_select 'td:nth-child(2)', @rush_job.locked_at.to_s
          assert_select 'td:nth-child(3)', @rush_job.locked_by
          assert_select 'td:nth-child(4)', @rush_job.job_class
          assert_select 'td:nth-child(5)', @rush_job.job_arguments.to_s
        end
      end
    end

    test 'should display queues' do
      get '/rush_job/'

      assert_select '#rush-job-dashboard-queues' do
        assert_select 'th:nth-child(1)', 'Name'
        assert_select 'th:nth-child(2)', 'Priority'
        assert_select 'th:nth-child(3)', 'Count'
        assert_select 'th:nth-child(4)', false, 'Clear'

        assert_select 'tr:nth-child(1)' do
          assert_select 'td:nth-child(1)', 'JobQueue0'
          assert_select 'td:nth-child(2)', '0'
          assert_select 'td:nth-child(3)', '1'
          assert_select 'td:nth-child(4)', false, 'Clear'
        end
      end
    end

    test 'display clear button when editing' do
      cookies[:rush_job_editing] = 'enabled'

      get '/rush_job/'

      assert_select '#rush-job-dashboard-queues' do
        assert_select 'th:nth-child(4)', 'Clear'

        assert_select 'tr:nth-child(1)' do
          assert_select 'td:nth-child(4)', 'Clear'
        end
      end
    end

    test 'invalid pagination' do
      get '/rush_job?locked_jobs_page=100'

      assert_redirected_to root_path

      assert_equal 'No jobs on that page, redirected to first page.', flash[:notice]
    end

    test 'delete queue' do
      assert_difference 'RushJob.queue_groups.count', -1 do
        delete '/rush_job/dashboard', params: { queue: @rush_job.queue, priority: @rush_job.priority }
      end

      assert_redirected_to root_path

      assert_equal "Cleared queue #{@rush_job.queue}", flash[:success]
    end
  end
end
