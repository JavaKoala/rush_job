module RushJob
  class DashboardController < ApplicationController
    include Pagy::Backend

    rescue_from Pagy::OverflowError, with: :redirect_to_first_page

    def index
      @pagy_locked_jobs, @locked_jobs = pagy(RushJob.locked_jobs,
                                             items: 10,
                                             page_param: :locked_jobs_page)

      @queue_groups = RushJob.queue_groups
      @pagy_queue, @job_queues = pagy_array(@queue_groups.keys,
                                            items: 10,
                                            page_param: :queue_page)
    end

    def redirect_to_first_page
      redirect_to root_path, notice: t(:invalid_page_notice)
    end
  end
end
