// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// move this to separate file and import
const newNoteForm = document.getElementById('new_task');
const noteTextarea = newNoteForm.lastChild;
const noteTitles = document.querySelectorAll('.note-title');
// const tasks = document.querySelectorAll('.note-title');
// const closeTaskBtn = document.querySelectorAll('.btn-close');
const taskNames = document.querySelectorAll('.task-name');
const CloseUpdateTaskBtns = document.querySelectorAll('.btn-close-task-update');

// Submit form and save notes
window.addEventListener('keydown', function(e) {
    if (e.key === 'Enter' && e.ctrlKey) {
      e.preventDefault();
      newNoteForm.submit();
  }
});

// Show form to add task details to new notes
noteTitles.forEach((title) => {
  title.addEventListener("click", function(e) {
    title.parentElement.style.display = "none";
    title.parentElement.nextElementSibling.style.display = "block";
  });
});

// Show details of saved tasks
taskNames.forEach((task) => {
  task.addEventListener("click", function(e) {
    task.nextElementSibling.style.display = "block";
    task.style.display = "none";
  });
});

// Hide task details
// closeTaskBtn.forEach((task) => {
//   task.addEventListener("click", function(e) {
//     // HIDE TASKS
//     console.log('line 42')
//   });
// });



CloseUpdateTaskBtns.forEach((btn) => {
  btn.addEventListener("click", function(e) {
    console.log('line 50')
    btn.parentElement.style.display = "none";
    btn.parentElement.previousElementSibling.style.display = "block";
  });
});
