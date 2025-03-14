pin 'rush_job/application', preload: true
pin 'rush_job/controllers/rush_job_confirm_controller', preload: true
pin 'rush_job/controllers/rush_job_polling_controller', preload: true
pin 'rush_job/controllers/rush_job_reload_jobs_table_controller', preload: true
pin 'rush_job/controllers/rush_job_table_update_controller', preload: true
pin 'bootstrap', to: 'https://ga.jspm.io/npm:bootstrap@5.3.1/dist/js/bootstrap.esm.js'
pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js'
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
