require 'test_helper'

module RushJob
  class SettingsTest < ActiveSupport::TestCase
    test 'change from default' do
      assert_equal 'dark', Settings.change_setting('theme', nil)
    end

    test 'change to default' do
      assert_equal 'light', Settings.change_setting('theme', 'dark')
    end

    test 'change from named default' do
      assert_equal 'dark', Settings.change_setting('theme', 'light')
    end

    test 'returns nil for non-existing setting' do
      assert_nil Settings.change_setting('test', 'value')
    end
  end
end
