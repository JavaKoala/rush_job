require 'test_helper'

module RushJob
  class SettingsHelperTest < ActionView::TestCase
    test 'returns light for the default theme' do
      assert_equal 'light', current_theme
    end

    test 'returns dark for the dark theme' do
      cookies[:rush_job_theme] = 'dark'

      assert_equal 'dark', current_theme
    end

    test 'returns dark for the inverted default theme' do
      assert_equal 'dark', invert_theme
    end

    test 'returns light for the inverted dark theme' do
      cookies[:rush_job_theme] = 'dark'

      assert_equal 'light', invert_theme
    end

    test 'returns true when editing enabled' do
      cookies[:rush_job_editing] = 'enabled'

      assert_predicate self, :editing_enabled?
    end

    test 'returns false when editing disabled' do
      cookies[:rush_job_editing] = 'disabled'

      assert_not editing_enabled?
    end
  end
end
