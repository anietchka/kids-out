import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["theme1", "theme2", "input"]

  change1() {
    console.log(this.theme1Target)
  }
}
