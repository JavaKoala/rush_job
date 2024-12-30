import { Application } from '@hotwired/stimulus';
import RushJobConfirmController from 'rush_job/controllers/rush_job_confirm_controller';
import RushJobPollingController from 'rush_job/controllers/rush_job_polling_controller';
import RushJobReloadJobsTableController from 'rush_job/controllers/rush_job_reload_jobs_table_controller';
import 'bootstrap';
import '@hotwired/turbo-rails';

window.Stimulus = Application.start();
Stimulus.register('rush-job-confirm', RushJobConfirmController);
Stimulus.register('rush-job-polling', RushJobPollingController);
Stimulus.register('rush-job-reload-jobs-table', RushJobReloadJobsTableController);
