import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="example-form"
export default class extends Controller {
  static targets = ["exampleContainer", "exampleTemplate"]

  connect() {
    console.log('Example Form Controller')
    console.log(this.exampleContainerTarget)
    console.log(this.index)
    this.index = this.exampleContainerTarget.children.length
  }

  addExample(event) {
    event.preventDefault()
    console.log(this.index)
    console.log(this.exampleTemplateTarget.innerHTML)
    const content = this.exampleTemplateTarget.innerHTML.replace(/NEW_EXAMPLE_RECORD/g, this.index)
    this.exampleContainerTarget.insertAdjacentHTML("beforeend", content)
    this.index++
  }

  removeExample(event) {
    event.preventDefault()
    const wrapper = event.target.closest("[data-example-form-target='wrapper']")
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
