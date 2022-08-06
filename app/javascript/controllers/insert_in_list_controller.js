import { Controller } from "@hotwired/stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["items", "form"];

  send(event) {
    event.preventDefault();
    const url = this.formTarget.action;
    fetch(url, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": csrfToken(),
      },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then(data => {
      this.formTarget.outerHTML = data.form;
      if( data.inserted_item ) {
        this.itemsTarget.insertAdjacentHTML('beforeend', data.inserted_item);
      }
    })
  }

}
