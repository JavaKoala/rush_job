import { Application } from '@hotwired/stimulus';
import Rails from '@rails/ujs';
import RushJobPollingController from './controllers/rush_job_polling_controller';
import RushJobReloadJobsTableController from './controllers/rush_job_reload_jobs_table_controller';
import 'bootstrap';

Rails.start();

window.Stimulus = Application.start();
Stimulus.register('rush-job-polling', RushJobPollingController);
Stimulus.register('rush-job-reload-jobs-table', RushJobReloadJobsTableController);
