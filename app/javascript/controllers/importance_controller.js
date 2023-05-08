import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="importance"
export default class extends Controller {
  static targets = [ "slider", "span" ]

  connect() {
    // console.log("This is connected to Stimulus!");
  }

  changeImportance(e) {
    this.spanTarget.innerHTML = this.sliderTarget.value;
    console.dir(this.spanTarget.style);
  }
}
