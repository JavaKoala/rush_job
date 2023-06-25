module RushJob
  class RushJobsController < ApplicationController
    include SortHelper
    include Pagy::Backend

    def index
      @pagy, @rush_jobs = pagy(RushJob.order("#{sort_column} #{sort_direction}"))
    end
  end
end
