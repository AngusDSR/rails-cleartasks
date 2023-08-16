import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-note-form-submit"
export default class extends Controller {
  static targets = [ "form" ]
  connect() {
    console.log('I am connected');
    console.log(this.formTarget);
  }
}


const newNoteForm = document.getElementById('new_task');

// Submit form and save notes
window.addEventListener('keydown', function(e) {
    if (e.key === 'Enter' && e.ctrlKey) {
      e.preventDefault();
      newNoteForm.submit();
  }
});
