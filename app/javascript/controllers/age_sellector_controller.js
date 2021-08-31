import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "age"]

  up() {
    const inputAge = parseInt(this.inputTarget.value, 10)
    if(inputAge < 12) {
      this.inputTarget.value = inputAge + 1
      this.ageTarget.innerText = `${inputAge + 1} ans`
    }
  }

  down() {
    const inputAge = parseInt(this.inputTarget.value, 10)
    if (inputAge > 0) this.inputTarget.value = parseInt(this.inputTarget.value, 10) - 1
    this.ageTarget.innerText = `${inputAge - 1} ans`
  }
}
