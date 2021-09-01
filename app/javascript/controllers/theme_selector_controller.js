import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["theme1", "theme2", "input"]

  change1() {
    this.inputTarget.value = "interieure";
    this.theme1Target.classList.add("active")
    this.theme2Target.classList.remove("active")
  }

  change2() {
    this.inputTarget.value = "exterieure";
    this.theme2Target.classList.add("active")
    this.theme1Target.classList.remove("active")
  }
}
