import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "body" ]

  get type() {
    return this.data.get("type");
  }

  get id() {
    return parseInt(this.data.get("id"));
  }

  payload() {
    return {
      comment: {
        commentable_id: this.id,
        commentable_type: this.type,
        body: this.bodyTarget.value
      }
    }
  }

  save() {
    console.log(JSON.stringify(this.payload()));
    fetch("/comments", {
      method: "POST",
      body: JSON.stringify(this.payload()),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      }
    }).then(response => response.json())
      .then(response => console.log(response))
      .catch(error => console.error(`Error: ${error}`))
  }
}
