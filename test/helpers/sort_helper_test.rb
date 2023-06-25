require 'test_helper'

module RushJob
  class SortHelperTest < ActionView::TestCase
    test 'sorting the jobs by column' do
      params[:sort] = 'queue'

      assert_equal sort_column, 'queue'
    end

    test 'default column sort' do
      assert_equal sort_column, 'id'
    end

    test 'invalid column sort' do
      params[:sort] = 'invalid'

      assert_equal sort_column, 'id'
    end

    test 'sorting the jobs by direction' do
      params[:direction] = 'desc'

      assert_equal sort_direction, 'desc'
    end

    test 'default direction sort' do
      assert_equal sort_direction, 'asc'
    end

    test 'invalid direction sort' do
      params[:direction] = 'invalid'

      assert_equal sort_direction, 'asc'
    end
  end
end
