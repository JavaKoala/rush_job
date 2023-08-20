import  { RushJobTableUpdateController } from './rush_job_table_update_controller.js'

let intervalID

export default class extends RushJobTableUpdateController {
  static targets = [ 'pollingTime', 'pollingTimeLabel', 'pollingSlide' ]

  connect() {
    this.pollingChange()
    this.stopPolling()
  }

  pollingChange() {
    const pollingLabelRegex = /\d+/;
    let pollingLabelUpdate = this.pollingTimeLabelTarget.innerHTML.replace(pollingLabelRegex, this.pollingTime())
    this.pollingTimeLabelTarget.innerHTML = pollingLabelUpdate
  }

  pollingToggle() {
    let pollingSlide = this.pollingSlideTarget

    if (pollingSlide.checked === true) {
      this.startPolling()
    } else {
      this.stopPolling()
    }
  }

  startPolling() {
    this.updateJobs()

    intervalID = setTimeout(() => {
      this.startPolling()
    }, this.pollingTime() * 1000)
  }

  stopPolling() {
    if (intervalID) {
      clearInterval(intervalID)
    }
  }

  pollingTime() {
    const pollingTimes = [3, 5, 8, 13, 21, 34, 55]
    let pollingTime = this.pollingTimeTarget.value || 3

    return pollingTimes[pollingTime]
  }
}