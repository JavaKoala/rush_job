import { Controller } from '@hotwired/stimulus';

export class RushJobTableUpdateController extends Controller {
  updateJobs() {
    const headers = { 'Accept': 'text/vnd.turbo-stream.html' };

    this.blurTable();
    this.clearFlash();

    fetch(document.location.href, { headers: headers })
      .then(response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
  }

  blurTable() {
    const jobsContainer = document.getElementById('rush-job-jobs-container');
    jobsContainer.classList.add('table-refresh');
  }

  clearFlash() {
    document.getElementById('rush-job-flash-messages').innerHTML = '';
  }
}
