import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ['form', 'content'];

  submitForm(event) {
    event.preventDefault();
    const form = this.formTarget;
    const formData = new FormData(form);

    fetch(form.action, {
      method: form.method,
      body: formData,
      headers: {
        Accept: "application/json"
      }
    })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          // Handle successful form submission (e.g., update UI, display success message)
          window.location.href = '/';
        } else {
          // Handle form submission errors (e.g., display error messages)
          this.handleFormErrors(data.errors);
        }
      })
      .catch(error => console.error(error));
  }

  handleFormErrors(errors) {
    // Handle form submission errors according to your requirements
    // For example, you can update specific error message elements or display a general error message
    console.log(errors);
  }
}
