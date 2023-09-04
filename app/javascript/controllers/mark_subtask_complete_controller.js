import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "iconSubtaskCompletion",
    "checker",
    "subtaskCheckboxForm",
    "subtaskText",
    "completedAll",
    "checkAllIcon"
  ];

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
    .catch(error => {
      console.error("Network error:", error);
    });
  }

  toggleCompletion(e) {
    const initialSubtaskIcon = e.currentTarget;
    const hiddenSubtaskCheckbox = this.checkerTargets[initialSubtaskIcon.id];
    const subtaskText = this.subtaskTextTargets[initialSubtaskIcon.id]

    if (hiddenSubtaskCheckbox.checked) {
      initialSubtaskIcon.innerHTML = '<i class="fa-regular fa fa-square subtask-checker"></i>';
      subtaskText.classList.remove('strikethrough');
      hiddenSubtaskCheckbox.checked = false
    } else {
      initialSubtaskIcon.innerHTML = '<i class="fa-solid fa-square subtask-checker"></i>';
      subtaskText.classList.add('strikethrough');
      hiddenSubtaskCheckbox.checked = true
    }

    this.submitForm(e);
  }

  toggleCompletionAll(e) {
    // check if all checkboxes are checked
    const allCheckboxesChecked = this.checkerTargets.every(checkbox => checkbox.checked);

    // add fw-bold to mark the icon as checked
    e.currentTarget.classList.toggle('fw-bold');

    // if all are checked then refer all checkboxes, otherwise filter to those unchecked
    const targetCheckboxes = allCheckboxesChecked
      ? this.iconSubtaskCompletionTargets
      : this.iconSubtaskCompletionTargets.filter(
          checkbox => !this.checkerTargets[checkbox.id].checked
        );

    // use array from above to toggle completion where necesarry
    targetCheckboxes.forEach(checkbox => {
      this.toggleCompletion({ currentTarget: checkbox });
    });
  }
}
