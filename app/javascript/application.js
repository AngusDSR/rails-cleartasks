// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// move this to separate file and import
const newNote = document.getElementById('new_task');
const tasks = document.querySelectorAll('.note-text');
const closeTaskBtn = document.querySelectorAll('.btn-close');
const taskViewBtns = document.querySelectorAll('.btn-view-task-details');
const noteTexts = document.querySelectorAll('.note-text');
const CloseUpdateTaskBtns = document.querySelectorAll('.btn-close-task-update');

window.addEventListener('keydown', function(e) {
  console.log(e.key === 'Enter' && e.ctrlKey)
    if (e.key === 'Enter' && e.ctrlKey) {
    e.preventDefault();
    console.log(newNote);
    console.dir(newNote);
    newNote.submit();
  }
});

tasks.forEach((task) => {
  task.addEventListener("click", function(e) {
    task.nextElementSibling.style.display = "block";
    task.style.display = "none";
  });
});

// closeTaskBtn.forEach((task) => {
//   task.addEventListener("click", function(e) {
//     // HIDE TASKS
//   });
// });

taskViewBtns.forEach((task) => {
  task.addEventListener("click", function(e) {
    task.nextElementSibling.nextElementSibling.style.display = "block";
    task.style.display = "none";
  });
});

noteTexts.forEach((task) => {
  task.addEventListener("click", function(e) {
    task.nextElementSibling.style.display = "block";
    task.style.display = "none";
  });
});

CloseUpdateTaskBtns.forEach((btn) => {
  btn.addEventListener("click", function(e) {
    btn.parentElement.style.display = "none";
    btn.parentElement.previousElementSibling.style.display = "block";
  });
});
