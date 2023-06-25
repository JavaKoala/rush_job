require 'test_helper'

module RushJob
  class RushJobTest < ActiveSupport::TestCase
    setup do
      @rush_job = rush_job_rush_jobs(:job_argument)
      @no_args_job = rush_job_rush_jobs(:job_no_arguments)
    end

    test 'job_class returns the class of the job' do
      assert_equal @rush_job.job_class, 'TestHandler'
    end

    test 'job_arguments returns the arguments of the job' do
      assert_equal @rush_job.job_arguments, ['arg1']
    end

    test 'job_arguments returns empty string for empty arguments' do
      assert_equal @no_args_job.job_arguments, ''
    end
  end
end
