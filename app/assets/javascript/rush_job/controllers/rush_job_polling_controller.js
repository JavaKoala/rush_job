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
    this.clearProgressInterval();
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
    this.updateJobs();
    this.startProgress();

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

    progressInterveralID = setInterval(() => {
      this.progressBarProgressTarget.style = `width: ${progressInterval - 1}%;`;
      progressInterval -= 1;
      console.log(progressInterval);
    }, this.pollingTime() * 10);
  }

  clearProgressInterval() {
    if (progressInterveralID) {
      clearInterval(progressInterveralID);
    }
  }
}
