import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toogle-nav"
export default class extends Controller {
  static targets = ["toggleMenu", "toggleUl"];
  connect() {
    console.log("Connected !");

  }

  openMenu() {
    this.toggleUlTarget.classList.toggle("d-none");

  }
}
