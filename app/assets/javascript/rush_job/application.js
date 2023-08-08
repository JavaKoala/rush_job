import 'bootstrap'
import Rails from '@rails/ujs'
Rails.start();

import { Application } from '@hotwired/stimulus'

import RushJobPollingController from './controllers/rush_job_polling_controller'
import RushJobReloadJobsTableController from './controllers/rush_job_reload_jobs_table_controller'

window.Stimulus = Application.start()
Stimulus.register('rush-job-polling', RushJobPollingController)
Stimulus.register('rush-job-reload-jobs-table', RushJobReloadJobsTableController)
