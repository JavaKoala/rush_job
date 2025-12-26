require 'test_helper'

module RushJob
  class SortHelperTest < ActionView::TestCase
    test 'sorting the jobs by column' do
      params[:sort] = 'queue'

      assert_equal 'queue', sort_column
    end

    test 'default column sort' do
      assert_equal 'id', sort_column
    end

    test 'invalid column sort' do
      params[:sort] = 'invalid'

      assert_equal 'id', sort_column
    end

    test 'sorting the jobs by direction' do
      params[:direction] = 'desc'

      assert_equal 'desc', sort_direction
    end

    test 'default direction sort' do
      assert_equal 'asc', sort_direction
    end

    test 'invalid direction sort' do
      params[:direction] = 'invalid'

      assert_equal 'asc', sort_direction
    end
  end
end
