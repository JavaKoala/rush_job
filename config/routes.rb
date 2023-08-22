RushJob::Engine.routes.draw do
  root 'dashboard#index'
  get '/rush_jobs', to: 'rush_jobs#index'
  patch '/theme', to: 'themes#update'
end
