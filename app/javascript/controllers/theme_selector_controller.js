import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["border1", "text1", "border2", "text2", "input"]

  change1() {
    this.inputTarget.value = "interieure";
    this.text1Target.classList.add("active");
    this.border1Target.classList.add("active");
    this.text2Target.classList.remove("active");
    this.border2Target.classList.remove("active");
  }

  change2() {
    this.inputTarget.value = "exterieure";
    this.text2Target.classList.add("active");
    this.border2Target.classList.add("active");
    this.text1Target.classList.remove("active");
    this.border1Target.classList.remove("active");
  }
}
