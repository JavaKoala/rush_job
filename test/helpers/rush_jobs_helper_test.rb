require 'test_helper'

module RushJob
  class RushJobsHelperTest < ActionView::TestCase
    test 'sortable column' do
      assert_equal '<a class="link-dark" target="_top" href="/rush_job/rush_jobs?direction=desc&amp;sort=id">Id</a>',
                   sortable('id')
    end

    test 'sortable direction' do
      params[:direction] = 'desc'

      assert_equal '<a class="link-dark" target="_top" href="/rush_job/rush_jobs?direction=asc&amp;sort=id">Id</a>',
                   sortable('id')
    end

    test 'sort different column and direction' do
      params[:direction] = 'desc'
      params[:sort] = 'id'

      assert_equal '<a class="link-dark" target="_top" ' \
                   'href="/rush_job/rush_jobs?direction=asc&amp;sort=priority">Priority</a>',
                   sortable('priority')
    end

    test 'sortable dark theme' do
      cookies[:rush_job_theme] = 'dark'

      assert_equal '<a class="link-light" target="_top" href="/rush_job/rush_jobs?direction=desc&amp;sort=id">Id</a>',
                   sortable('id')
    end

    test 'sort arrow is not displayed for unsorted column' do
      params[:sort] = 'id'

      assert_nil sort_arrow('priority')
    end

    test 'sort decending arrow' do
      params[:direction] = 'desc'
      params[:sort] = 'id'
      arrow_image = '<img id="rush-job-down-arrow" alt="down arrow" src="/images/rush_job/arrow-down-dark.svg" />'

      assert_equal arrow_image, sort_arrow('id')
    end

    test 'sort ascending arrow' do
      params[:sort] = 'id'
      arrow_image = '<img id="rush-job-up-arrow" alt="up arrow" src="/images/rush_job/arrow-up-dark.svg" />'

      assert_equal arrow_image, sort_arrow('id')
    end

    test 'sort ascending arrow dark theme' do
      cookies[:rush_job_theme] = 'dark'
      params[:sort] = 'id'
      arrow_image = '<img id="rush-job-up-arrow" alt="up arrow" src="/images/rush_job/arrow-up-light.svg" />'

      assert_equal arrow_image, sort_arrow('id')
    end
  end
end
