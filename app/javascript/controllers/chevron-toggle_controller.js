import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="etymology"
export default class extends Controller {
  static targets = [ "content", "arrow", "parameter" ]

  connect() {
  }

  toggle() {
    if (this.hasParameterTarget) {
      this.parameterTarget.value = this.parameterTarget.value === "true" ? "false" : "true";
    }

    this.contentTarget.classList.toggle("hidden");

    const currentSrc = this.arrowTarget.src;
    const downSrc = this.arrowTarget.dataset.downSrc;
    const rightSrc = this.arrowTarget.dataset.rightSrc;

    if (currentSrc.includes(rightSrc)) {
      this.arrowTarget.src = downSrc;
    } else {
      this.arrowTarget.src = rightSrc;
    }
  }
}
