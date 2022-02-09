import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let titles = $("#autocomplete").data('title');

    $("#autocomplete").autocomplete({
      source: titles
    });

    $(".ui-autocomplete").css('zIndex','100000');
  }
}
