import { Controller } from '@hotwired/stimulus'
import Rails from '@rails/ujs'

export class RushJobTableUpdateController extends Controller {
  updateJobs() {
    this.blurTable()

    Rails.ajax({
      url: document.location.href,
      type: 'GET',
      dataType: 'script'
    })
  }

  blurTable() {
    let jobs_container = document.getElementById('rush-job-jobs-container')
    jobs_container.classList.add('table-refresh')
  }
}
