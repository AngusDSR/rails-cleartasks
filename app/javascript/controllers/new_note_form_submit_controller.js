import { Controller, add } from "@hotwired/stimulus"

// Connects to data-controller="new-note-form-submit"
export default class extends Controller {
  static targets = [ "form" ]
  connect() {
    this.addEventListenerToWindow();
  }

  addEventListenerToWindow() {
    window.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && e.ctrlKey) {
        e.preventDefault();
        this.formTarget.submit();
      }
    });
  }
}
