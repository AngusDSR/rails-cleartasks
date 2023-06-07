import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="subtask-delete"
export default class extends Controller {



  connect() {
    // console.log(this.deleteTarget);
  }

  deleteTask(event) {
    event.preventDefault();
    const link = event.currentTarget;
    fetch(link.href, {
      method: link.dataset.turboMethod,
      headers: {
        Accept: "application/text"
      }
    })
    .then(response => {
      console.log(response); // Add this line to inspect the response
      return response.json();
    })
      .then(data => {
        if (data.success) {
          // Remove the deleted task from the UI
          link.closest('.sub-task-item').remove();
        } else {
          // Handle errors
          console.error(data.errors);
        }
      })
      .catch(error => console.error(error));
  }
}
