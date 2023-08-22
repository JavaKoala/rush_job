require 'application_system_test_case'

module RushJob
  class NavigationTest < ApplicationSystemTestCase
    test 'root path' do
      visit '/rush_job/'
      assert_selector 'h2', text: 'Locked Jobs'
    end

    test 'navigate to jobs page' do
      visit '/rush_job/'
      click_link 'Jobs'
      assert_selector '#rush-job-jobs'
    end

    test 'navigate to dashboard' do
      visit '/rush_job/'
      click_link 'Jobs'
      click_link 'Dashboard'
      assert_selector 'h2', text: 'Locked Jobs'
    end

    test 'navigate to root path' do
      visit '/rush_job/'
      click_link 'Jobs'
      click_link 'Delayed Jobs'
      assert_selector 'h2', text: 'Locked Jobs'
    end
  end
end
