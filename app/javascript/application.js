// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

const tasks = document.querySelectorAll('.note-text')

function openTask(e) {
  console.log(e);
}

tasks.forEach((task) => {
  task.addEventListener("click", openTask(e));
});

console.log("hello");
