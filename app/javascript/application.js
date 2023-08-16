// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// move this to separate file and import
const newNoteForm = document.getElementById('new_task');

// Submit form and save notes
window.addEventListener('keydown', function(e) {
  e.preventDefault();
    if (e.key === 'Enter' && e.ctrlKey) {
      newNoteForm.submit();
  }
});
