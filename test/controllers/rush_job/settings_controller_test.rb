require 'test_helper'

module RushJob
  class SettingsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should redirect to root_path' do
      patch settings_url

      assert_redirected_to root_path
    end

    test 'should set theme cookie to dark' do
      patch settings_url, params: { setting: 'theme' }

      assert_redirected_to root_path
      assert_equal cookies[:rush_job_theme], 'dark'
    end

    test 'should change theme if present' do
      cookies[:rush_job_theme] = 'dark'

      patch settings_url, params: { setting: 'theme' }

      assert_equal cookies[:rush_job_theme], 'light'
    end

    test 'should enable editing' do
      patch settings_url, params: { setting: 'editing' }

      assert_equal cookies[:rush_job_editing], 'enabled'
    end

    test 'should disable editing' do
      cookies[:rush_job_editing] = 'enabled'

      patch settings_url, params: { setting: 'editing' }

      assert_equal cookies[:rush_job_editing], 'disabled'
    end

    test 'should not change non-existing setting' do
      patch settings_url, params: { setting: 'test' }

      assert_redirected_to root_path
      assert_nil cookies[:rush_job_test]
    end
  end
end
