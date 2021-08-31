import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]
  static values = {
    moreText: String,
    lessText: String
  }


  toggle(event) {
    event.preventDefault()

    const descriptionToShow = this.contentTarget.classList.contains("read-more")
    const button = event.target

    if (descriptionToShow) {
      button.innerHTML = this.lessTextValue
      this.contentTarget.classList.remove("read-more")
    } else {
      button.innerHTML = this.moreTextValue
      this.contentTarget.classList.add("read-more")
    }
  }

}
