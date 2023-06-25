module RushJob
  class RushJob < ApplicationRecord
    self.table_name = 'delayed_jobs'

    def job_class
      job_data[:job_class]
    end

    def job_arguments
      job_data[:arguments].presence || ''
    end

    private

    def handler_hash
      safe_yaml = handler.sub('!ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper', '')
      Psych.safe_load(safe_yaml, symbolize_names: true)
    end

    def job_data
      handler_hash[:job_data]
    end
  end
end
