// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


// move this to separate file and import
const tasks = document.querySelectorAll('.note-text')
const closeTaskBtn = document.querySelectorAll('.btn-close')

tasks.forEach((task) => {
  task.addEventListener("click", function(e) {
    task.nextElementSibling.style.display = "block";
    task.style.display = "none";
  });
});

closeTaskBtn.forEach((task) => {
  task.addEventListener("click", function(e) {
    // HIDE TASKS
  });
});
