module RushJob
  require 'importmap-rails'
  require 'bootstrap'
  require 'pagy'
  require 'pagy/extras/bootstrap'

  class Engine < ::Rails::Engine
    isolate_namespace RushJob

    initializer 'rush_job.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/assets/javascripts')
    end

    initializer 'rush_job.assets.precompile' do |app|
      app.config.assets.precompile += %w[
        rush_job/application.css
        rush_job/application.scss
        rush_job/application.js
        rush_job_manifest.js
        bootstrap.min.js
      ]
    end
  end
end
