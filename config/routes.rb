RushJob::Engine.routes.draw do
  root 'rush_jobs#index'
  patch '/theme', to: 'themes#update'
end
