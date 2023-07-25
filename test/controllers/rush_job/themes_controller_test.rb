require 'test_helper'

module RushJob
  class ThemesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should redirect to root_path' do
      patch theme_url

      assert_redirected_to root_path
    end

    test 'should set theme cookie to dark' do
      patch theme_url

      assert_equal cookies[:rush_job_theme], 'dark'
    end

    test 'should change theme if present' do
      cookies[:rush_job_theme] = 'dark'

      patch theme_url

      assert_equal cookies[:rush_job_theme], 'light'
    end
  end
end
