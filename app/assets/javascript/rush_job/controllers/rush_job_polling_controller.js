import { RushJobTableUpdateController } from './rush_job_table_update_controller';

let intervalID;
let progressInterveralID;

export default class extends RushJobTableUpdateController {
  static targets = ['pollingTime', 'pollingTimeLabel', 'pollingSlide', 'progressBar', 'progressBarProgress'];

  connect() {
    this.pollingChange();
    this.stopPolling();
  }

  pollingChange() {
    const pollingLabelRegex = /\d+/;
    const pollingTimeTargetHtml = this.pollingTimeLabelTarget.innerHTML;
    const pollingLabelUpdate = pollingTimeTargetHtml.replace(pollingLabelRegex, this.pollingTime());
    this.pollingTimeLabelTarget.innerHTML = pollingLabelUpdate;
  }

  pollingToggle() {
    const pollingSlide = this.pollingSlideTarget;

    if (pollingSlide.checked === true) {
      this.startPolling();
      this.progressBarTarget.style = 'height: 7px;';
    } else {
      this.stopPolling();
      this.progressBarTarget.style = 'display: none;';
    }
  }

  startPolling() {
    this.startProgress();
    this.updateJobs();

    intervalID = setTimeout(() => {
      this.startPolling();
    }, this.pollingTime() * 1000);
  }

  stopPolling() {
    if (intervalID) {
      clearInterval(intervalID);
    }

    this.clearProgressInterval();
  }

  pollingTime() {
    const pollingTimes = [3, 5, 8, 13, 21, 34, 55];
    const pollingTime = this.pollingTimeTarget.value || 3;

    return pollingTimes[pollingTime];
  }

  startProgress() {
    this.clearProgressInterval();
    let progressInterval = 100;
    let progressPrecent = 1;
    let progressIntervalTime = this.pollingTime() * 10;
    if (this.pollingTime() < 13) {
      progressPrecent = 10;
      progressIntervalTime = progressIntervalTime * 10;
    }

    progressInterveralID = setInterval(() => {
      progressInterval -= progressPrecent;
      this.progressBarProgressTarget.style = `width: ${progressInterval}%;`;
      this.progressBarTarget.setAttribute('aria-valuenow', progressInterval);
    }, progressIntervalTime);
  }

  clearProgressInterval() {
    if (progressInterveralID) {
      clearInterval(progressInterveralID);
    }
  }
}
