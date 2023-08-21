import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["iconSubtaskCompletion", "checker", "subtaskCheckboxForm", "subtaskText", "completedAll", "checkAllIcon"]

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
          // console.log("Subtask saved successfully.");
        } else {
          console.error("Failed to save subtask.", data.errors);
        }
      })
      .catch(error => {
        // Handle network error
      });
  }

  toggleCompletion(e) {
    // new icon
    const icon = e.currentTarget;
    // default icon
    const checkbox = this.checkerTargets[icon.id];

    const subtaskText = this.subtaskTextTargets[icon.id]

    if (checkbox.checked) {
      icon.innerHTML = '<i class="fa-regular fa fa-square subtask-checker"></i>';
      subtaskText.classList.remove('strikethrough');
      checkbox.checked = false
    } else {
      icon.innerHTML = '<i class="fa-solid fa-square subtask-checker"></i>';
      subtaskText.classList.add('strikethrough');
      checkbox.checked = true
    }

    this.submitForm(e);
  }

  toggleCompletionAll(e) {
    // new icon
    const completedAllCheckbox = e.currentTarget;
    // new icon is checked
    const allChecked = completedAllCheckbox.checked;

    // three new icons
    const checkboxes = this.iconSubtaskCompletionTargets;

    // default icon
    const checkAllIcon = this.checkAllIconTarget;

    // let complete = true;


    checkboxes.forEach((checkbox) => {
      // each checkbox
      const icon = checkbox;
      // text
      const subtaskText = this.subtaskTextTargets[icon.id];
      // default icon
      const checkboxInput = this.checkerTargets[checkbox.id];


      if (allChecked) {
        icon.innerHTML = '<i class="fa-solid fa-square subtask-checker"></i>';
        subtaskText.classList.add('strikethrough');
      } else {
        icon.innerHTML = '<i class="fa-regular fa fa-square subtask-checker"></i>';
        subtaskText.classList.remove('strikethrough');
      }

      this.toggleCompletion({ currentTarget: checkbox });
    });

    // Update the checkAllIcon based on `complete` value
    if (allChecked) {
      checkAllIcon.innerHTML = '<i class="fa-solid fa-square subtask-checker"></i>';
    } else {
      checkAllIcon.innerHTML = '<i class="fa-regular fa fa-square subtask-checker"></i>';
    }
  }



}
