module RushJob
  class ThemesController < ApplicationController
    def update
      cookies.permanent[:rush_job_theme] = if cookies[:rush_job_theme] == 'dark'
                                             'light'
                                           else
                                             'dark'
                                           end

      redirect_to root_path
    end
  end
end
