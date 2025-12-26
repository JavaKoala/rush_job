module RushJob
  require 'importmap-rails'
  require 'pagy'
  require 'propshaft'

  class Engine < ::Rails::Engine
    isolate_namespace RushJob

    initializer 'rush_job.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/assets/javascripts')
    end
  end
end
