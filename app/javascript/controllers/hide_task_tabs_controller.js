import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tasksTitle", "taskTabButton" ]

  connect() {
  }

  highlightCurrentTask(e) {
    let thisTab = this.taskTabButtonTargets[e.currentTarget.id]
    let taskBody = thisTab.parentElement.nextElementSibling

    // hide/show the title
    if (this.tasksTitleTarget.style.display != "none") {
      this.tasksTitleTarget.style = "display: none;";
    } else {
      this.tasksTitleTarget.style = "display: block;"
    }

    // toggle the style of the current tab to be a title
    thisTab.classList.toggle('section-title');
    thisTab.classList.toggle('task-as-title');

    // toggle display of all other tabs
    this.taskTabButtonTargets.forEach(button => {
      if (button !== thisTab) {
        button.classList.toggle('d-none')
      }
    });
  }
}
