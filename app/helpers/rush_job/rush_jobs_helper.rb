module RushJob
  module RushJobsHelper
    include SortHelper
    include Pagy::Frontend

    def sortable(column)
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
      link_to t(column), rush_job.root_path({ sort: column, direction: })
    end

    def sort_arrow(column)
      return unless column == sort_column

      if sort_direction == 'desc'
        image_tag('rush_job/arrow-down.svg', id: 'rush-job-down-arrow', alt: 'down arrow')
      else
        image_tag('rush_job/arrow-up.svg', id: 'rush-job-up-arrow', alt: 'up arrow')
      end
    end
  end
end
