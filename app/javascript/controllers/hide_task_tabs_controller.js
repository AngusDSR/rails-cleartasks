import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tasksTitle", "taskTabButton" ]

  connect() {
    console.log('I am here8')
  }

  test(e) {
    this.tasksTitleTarget.innerText = "Clicked"
    // when I click a tab title, it should:
    // hide all other tabs
    // ensure that the current task has full height
    // set the title of the section to the name of the task
  }
}
