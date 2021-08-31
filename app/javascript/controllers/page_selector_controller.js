import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["page1", "page2", "page3"]

  next1() {
    this.page1Target.style.display = "none"
    this.page2Target.style.display = "block"
    this.page3Target.style.display = "none"
  }

  next2() {
    this.page1Target.style.display = "none"
    this.page2Target.style.display = "none"
    this.page3Target.style.display = "block"
  }

  back1() {
    this.page1Target.style.display = "block"
    this.page2Target.style.display = "none"
    this.page3Target.style.display = "none"
  }


}
