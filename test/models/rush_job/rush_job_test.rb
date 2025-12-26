require 'test_helper'

module RushJob
  class RushJobTest < ActiveSupport::TestCase
    self.use_transactional_tests = true

    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
      @no_args_job = rush_job_rush_jobs(:job_no_arguments)
      @unlocked_job = rush_job_rush_jobs(:last_job)
    end

    test 'locked_jobs' do
      assert_includes RushJob.locked_jobs, @rush_job
      assert_not RushJob.locked_jobs.include?(@unlocked_job)
    end

    test 'locked_jobs order' do
      assert_equal RushJob.locked_jobs.first, @rush_job
    end

    test 'queue_groups' do
      assert_equal 1, RushJob.queue_groups[['Test queue', 0]]
      assert_equal 3, RushJob.queue_groups[['Test queue', 1]]
    end

    test 'queue_groups order' do
      assert_equal [['JobQueue0', 0], 1], RushJob.queue_groups.first
      assert_equal [['JobQueue24', 24], 1], RushJob.queue_groups.to_a.last
    end

    test 'queue_group' do
      assert_equal RushJob.queue_group(@rush_job.queue, @rush_job.priority).first, @rush_job
      assert_equal RushJob.queue_group(@no_args_job.queue, @no_args_job.priority).first, @no_args_job
      assert_equal RushJob.queue_group(@no_args_job.queue, @no_args_job.priority).last, @unlocked_job
    end

    test 'clear_queue' do
      RushJob.clear_queue(@rush_job.queue, @rush_job.priority)

      assert_empty RushJob.queue_group(@rush_job.queue, @rush_job.priority)
    end

    test 'job_class returns the class of the job' do
      assert_equal 'TestHandler', @rush_job.job_class
    end

    test 'job_arguments returns the arguments of the job' do
      assert_equal ['arg1'], @rush_job.job_arguments
    end

    test 'job_arguments returns empty string for empty arguments' do
      assert_equal '', @no_args_job.job_arguments
    end
  end
end
