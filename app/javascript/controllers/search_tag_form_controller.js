import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-tag-form"
export default class extends Controller {
  static targets = ["tagContainer", "tagTemplate"]

  connect() {
    this.index = this.tagContainerTarget.children.length
  }

  addTag(event) {
    event.preventDefault()
    const content = this.tagTemplateTarget.innerHTML.replace(/NEW_SEARCH_TAG_RECORD/g, this.index)
    this.tagContainerTarget.insertAdjacentHTML("beforeend", content)
    this.index++
  }

  removeTag(event) {
    event.preventDefault()
    const wrapper = event.target.closest("[data-search-tag-form-target='wrapper']")
    const destroyInput = wrapper.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = 1
      wrapper.style.display = "none"
    } else {
      wrapper.remove()
    }
  }
}
