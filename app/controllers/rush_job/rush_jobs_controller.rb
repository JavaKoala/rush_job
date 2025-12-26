module RushJob
  class RushJobsController < ApplicationController
    include SortHelper
    include Pagy::Method

    rescue_from Pagy::RangeError, with: :redirect_to_first_page

    def index
      @pagy, @rush_jobs = pagy(RushJob.order("#{sort_column} #{sort_direction}"), raise_range_error: true)

      respond_to do |format|
        format.html
        format.turbo_stream
      end
    end

    private

    def redirect_to_first_page
      redirect_to rush_jobs_path, notice: t(:invalid_page_notice)
    end
  end
end
