import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    id: Number,
  }

  connect() {
    document.getElementById("category-" + this.idValue).classList.add('text-white')
  }
}
