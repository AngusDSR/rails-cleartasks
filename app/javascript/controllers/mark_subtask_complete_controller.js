import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["iconSubtaskCompletion", "checker", "subtaskCheckboxForm"]
  // The error message suggests that the controller is trying to access the iconTarget before it has been connected.
  //  This can happen if the controller is connected before the DOM elements are fully loaded.
  connect() {
    console.log(this.subtaskCheckboxFormTargets);
  }


  // handleCheck(event) {
  //   const checkbox = event.currentTarget;
  //   const icon = this.iconSubtaskCompletionTarget;

  //   if (checkbox.checked) {
  //     icon.classList.replace("fa-square", "fa-check-square");
  //   } else {
  //     icon.classList.replace("fa-check-square", "fa-square");
  //   }

  //   this.submitForm();
  // }

  submitForm(e) {
    const form = this.subtaskCheckboxFormTargets[e.currentTarget.id]
    const formData = new FormData(form);
    console.log(e.currentTarget.id);
    console.log(this.subtaskCheckboxFormTargets);
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
      icon.innerHTML = '<i class="fa-solid fa-square"></i>';
      checkbox.checked = false
    } else {
      icon.innerHTML = '<i class="fa-regular fa fa-square"></i>';
      checkbox.checked = true
    }

    this.submitForm();
  }
}



  // connect() {
  //   // console.log("hello");
  //   this.updateIcon = this.updateIcon.bind(this);
  //   this.updateIcon();
  // }

  // handleCheck(event) {
  //   this.updateIcon();
  //   // this.saveSubtask();
  // }

  // updateIcon() {
  //   const checkbox = this.element.querySelector("input[type='checkbox']");
  //   console.log("Checkbox element:", checkbox);
  //   const icon = checkbox.closest(".d-flex").querySelector("[data-mark-subtask-complete-target='icon']");
  //   console.log("Icon element:", icon);

  //   if (checkbox.checked) {
  //     icon.classList.remove("fa-regular");
  //     icon.classList.remove("fa-square");
  //     icon.classList.add("fa-solid");
  //     icon.classList.add("fa-check-square");
  //   } else {
  //     icon.classList.remove("fa-solid");
  //     icon.classList.remove("fa-check-square");
  //     icon.classList.add("fa-regular");
  //     icon.classList.add("fa-square");
  //   }
  // }

  // saveSubtask() {
  //   const checkbox = this.element.querySelector("input[type='checkbox']");
  //   const form = checkbox.closest("form");

  //   console.log("Form action:", form.action);

  //   fetch(form.action, {
  //     method: "PUT",
  //     body: new FormData(form)
  //   })
  //   .then(response => response.json())
  //   .then(data => {
  //     if (data.success) {
  //       console.log("Subtask saved successfully.");
  //     } else {
  //       console.error("Failed to save subtask.", data.errors);
  //     }
  //   })
  //   .catch(error => {
  //     console.error("An error occurred:", error);
  //   });
  // }


// handle check
// check , change icon, save form, ajax
// remain collapsed
