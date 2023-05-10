import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-subtask-complete"
export default class extends Controller {
  connect() {
    console.log("I'm connected - sub task")
  }
}
