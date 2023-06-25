Rails.application.routes.draw do
  mount RushJob::Engine => '/rush_job'
end
