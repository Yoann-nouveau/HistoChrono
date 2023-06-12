import { Controller } from "@hotwired/stimulus"

static targets = [ "scroll-target" ]

// Connects to data-controller="scroll"
export default class extends Controller {
  connect() {

    console.log("hello");
    this.element.scroll(0, 1000);

  }

}
