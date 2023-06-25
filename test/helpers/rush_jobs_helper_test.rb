require 'test_helper'

module RushJob
  class RushJobsHelperTest < ActionView::TestCase
    test 'sortable column' do
      assert_equal '<a href="/rush_job/?direction=desc&amp;sort=id">Id</a>', sortable('id')
    end

    test 'sortable direction' do
      params[:direction] = 'desc'
      assert_equal '<a href="/rush_job/?direction=asc&amp;sort=id">Id</a>', sortable('id')
    end

    test 'sort different column and direction' do
      params[:direction] = 'desc'
      params[:sort] = 'id'

      assert_equal '<a href="/rush_job/?direction=asc&amp;sort=priority">Priority</a>', sortable('priority')
    end

    test 'sort arrow is not displayed for unsorted column' do
      params[:sort] = 'id'

      assert_nil sort_arrow('priority')
    end

    test 'sort decending arrow' do
      params[:direction] = 'desc'
      params[:sort] = 'id'
      arrow_image = '<img id="rush-job-down-arrow" alt="down arrow" src="/images/rush_job/arrow-down.svg" />'

      assert_equal arrow_image, sort_arrow('id')
    end

    test 'sort ascending arrow' do
      params[:sort] = 'id'
      arrow_image = '<img id="rush-job-up-arrow" alt="up arrow" src="/images/rush_job/arrow-up.svg" />'

      assert_equal arrow_image, sort_arrow('id')
    end
  end
end
