import { Controller } from "stimulus"

// backcard = document.querySelectorAll(".flip-card-back");
// backcard.scrollIntoView({ block: "start" });
export default class extends Controller {

  get marginNavbar() {
    return document.querySelector(".margin-navbar");
  }

  flip(e) {
    e.preventDefault();
    console.log(this.marginNavbar)
    this.element.classList.toggle("flipped");
    if (this.element.classList.contains("flipped")) {
      this.marginNavbar.style.overflowX = "unset";
      this.marginNavbar.style.overflowY = "unset";
      window.scrollTo(0, 0);
    } else {
      this.marginNavbar.style.overflowX = "hidden";
      this.marginNavbar.style.overflowY = "scroll";
    }
  }

}
