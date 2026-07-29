import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="example-form"
export default class extends Controller {
  static targets = ["modal"]

  toggleHidden() {
    this.modalTarget.classList.toggle("hidden");
  }
}
