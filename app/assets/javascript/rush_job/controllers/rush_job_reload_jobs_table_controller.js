import  { RushJobTableUpdateController } from './rush_job_table_update_controller.js'

export default class extends RushJobTableUpdateController {
  reloadJobs() {
    this.updateJobs()
  }
}
