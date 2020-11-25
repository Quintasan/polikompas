import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "item" ]

  get score() {
    return parseInt(this.data.get("score"))
  }

  set score(value) {
    this.data.set("score", value)
    this.updateScore()
  }

  get type() {
    return this.data.get("type")
  }

  get id() {
    return parseInt(this.data.get("id"))
  }

  payload(action) {
    return {
      id: this.id,
      type: this.type,
      user_action: action
    }
  }

  post(action) {
    fetch("/vote", {
      method: "POST",
      body: JSON.stringify(this.payload(action)),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      }
    }).then(response => response.json())
      .then(response => this.score = response["score"])
      .catch(error => console.error(`Error: ${error}`))
  }

  updateScore() {
    this.itemTarget.querySelector(".score").innerText = this.score
  }

  upvote() {
    this.post("upvote")
  }

  downvote() {
    this.post("downvote")
  }

  removeVote() {
    this.post("remove-vote")
  }
}
