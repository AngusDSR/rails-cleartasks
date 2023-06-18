import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slider", "span" ]

  connect() {
  }

  changeImportance(e) {
    this.spanTarget.innerHTML = this.sliderTarget.value;
    console.dir(this.spanTarget.style);
  }
}
