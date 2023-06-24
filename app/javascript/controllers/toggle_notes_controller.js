import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-notes"
export default class extends Controller {
  static targets = ['noteDetails', 'noteTitle', 'closeNoteBtn'];

  connect() {
  }

  toggleNoteDetails(e) {
    e.preventDefault();
    this.noteDetailsTarget.classList.toggle('hidden')
    this.noteTitleTargets.forEach((noteTitle) => {
      noteTitle.classList.toggle('hidden')
    });
  };
};
