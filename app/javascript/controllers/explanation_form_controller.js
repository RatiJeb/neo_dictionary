import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="explanation-form"
export default class extends Controller {
  static targets = ["explanationContainer", "explanationTemplate"]

  connect() {
    console.log('Explanation Form Controller')
    console.log(this.explanationContainerTarget)
    this.index = this.explanationContainerTarget.children.length - 1
    console.log(this.index)
  }

  addExplanation(event) {
    event.preventDefault()
    console.log(this.explanationContainerTarget)
    console.log(this.index)
    const content = this.explanationTemplateTarget.innerHTML.replace(/NEW_EXPLANATION_RECORD/g, this.index)
    this.explanationContainerTarget.insertAdjacentHTML("beforeend", content)
    this.index++
  }

  removeExplanation(event) {
    event.preventDefault()
    const wrapper = event.target.closest("[data-explanation-form-target='wrapper']")
    const destroyInput = wrapper.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = 1
      wrapper.style.display = "none"
    } else {
      wrapper.remove()
    }
    this.index--
  }
}
