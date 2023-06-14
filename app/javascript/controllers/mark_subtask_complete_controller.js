import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["iconSubtaskCompletion", "checker", "subtaskCheckboxForm"]

  connect() {
  }

  submitForm(e) {
    const form = this.subtaskCheckboxFormTargets[e.currentTarget.id];
    const formData = new FormData(form);

    fetch(form.getAttribute("action"), {
      method: form.getAttribute("method"),
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content"),
      },
    })
    .then(response => response.json())
      .then(data => {
        if (data.success) {
          console.log("Subtask saved successfully.");
        } else {
          console.error("Failed to save subtask.", data.errors);
        }
      })
      .catch(error => {
        // Handle network error
      });
  }

  toggleCompletion(e) {
    const icon = e.currentTarget;
    const checkbox = this.checkerTargets[icon.id];

    if (checkbox.checked) {
      icon.innerHTML = '<i class="fa-regular fa fa-square"></i>';
      checkbox.checked = false
    } else {
      icon.innerHTML = '<i class="fa-solid fa-square"></i>';
      checkbox.checked = true
    }

    this.submitForm(e);
  }
}
