import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-subtask-complete"
export default class extends Controller {
  static targets = [ "form", "checkbox" ]

  connect() {
    // console.log("I'm connected - mark subtask completed")
  }

  markCompleted() {
    // console.log("completed")
    // on click:
      // update checkbox
      // submit form
      // change class on subtask - strikethrough etc
      // do not reload page
      console.log{
        this.CheckboxTarget;
      }
  }
}
