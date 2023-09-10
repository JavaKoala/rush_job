require 'test_helper'

module RushJob
  class SettingsHelperTest < ActionView::TestCase
    test 'returns light for the default theme' do
      assert_equal current_theme, 'light'
    end

    test 'returns dark for the dark theme' do
      cookies[:rush_job_theme] = 'dark'

      assert_equal current_theme, 'dark'
    end

    test 'returns dark for the inverted default theme' do
      assert_equal invert_theme, 'dark'
    end

    test 'returns light for the inverted dark theme' do
      cookies[:rush_job_theme] = 'dark'

      assert_equal invert_theme, 'light'
    end

    test 'returns true when editing enabled' do
      cookies[:rush_job_editing] = 'enabled'

      assert_equal editing_enabled?, true
    end

    test 'returns false when editing disabled' do
      cookies[:rush_job_editing] = 'disabled'

      assert_equal editing_enabled?, false
    end
  end
end
