import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    id: Number,
  }

  connect() {
    let subcategory = $('[data-subcategory]').data('subcategory')
    document.getElementById("category-" + this.idValue).classList.add('text-white')

    if (subcategory) {
      document.getElementById("subcategory-" + subcategory).classList.add('text-white')
    }
  }
}
