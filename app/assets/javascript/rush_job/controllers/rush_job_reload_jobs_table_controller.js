import { RushJobTableUpdateController } from './rush_job_table_update_controller';

export default class extends RushJobTableUpdateController {
  reloadJobs() {
    this.updateJobs();
  }
}
