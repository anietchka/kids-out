import { Controller } from "stimulus"

// backcard = document.querySelectorAll(".flip-card-back");
// backcard.scrollIntoView({ block: "start" });
export default class extends Controller {

  flip(e) {
    e.preventDefault();
    this.element.classList.toggle("flipped");
    window.scrollTo(0, 0);
  }

}
