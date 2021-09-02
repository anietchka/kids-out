import { Controller } from "stimulus"

export default class extends Controller {

  flip(e) {
    e.preventDefault();
    this.element.classList.toggle("flipped");
    $("html, body").animate({
      scrollTop: 0
    }, 600);
  }
}
