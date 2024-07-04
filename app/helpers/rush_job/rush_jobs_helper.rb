module RushJob
  module RushJobsHelper
    include ApplicationHelper
    include SortHelper
    include Pagy::Frontend

    def sortable(column)
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
      link_to t(column),
              rush_job.rush_jobs_path({ sort: column, direction: direction }),
              class: "link-#{invert_theme}",
              target: '_top'
    end

    def sort_arrow(column)
      return unless column == sort_column

      if sort_direction == 'desc'
        image_tag("rush_job/arrow-down-#{invert_theme}.svg", id: 'rush-job-down-arrow', alt: 'down arrow')
      else
        image_tag("rush_job/arrow-up-#{invert_theme}.svg", id: 'rush-job-up-arrow', alt: 'up arrow')
      end
    end
  end
end
