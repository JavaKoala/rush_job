module RushJob
  class DashboardController < ApplicationController
    include Pagy::Backend

    rescue_from Pagy::OverflowError, with: :redirect_to_first_page

    def index
      @pagy_locked_jobs, @locked_jobs = pagy(RushJob.locked_jobs, items: 10, page_param: :locked_jobs_page)
      @queue_groups = RushJob.queue_groups
      @pagy_queue, @job_queues = pagy_array(@queue_groups.keys, items: 10, page_param: :queue_page)

      respond_to do |format|
        format.html
        format.turbo_stream
      end
    end

    def destroy
      RushJob.clear_queue(queue_params[:queue], queue_params[:priority])

      flash[:success] = t(:cleared_queue, queue: queue_params[:queue])
      redirect_to root_path, status: :see_other
    end

    private

    def queue_params
      params.permit(:queue, :priority)
    end

    def redirect_to_first_page
      redirect_to root_path, notice: t(:invalid_page_notice)
    end
  end
end
