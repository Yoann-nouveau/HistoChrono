import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {

  connect() {
    const target = document.querySelector(".circle.active")
    target.scrollIntoView();
  }
}
