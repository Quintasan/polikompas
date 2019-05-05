import { Controller } from "stimulus"

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

  get payload() {
    return {
      type: this.type,
      id: this.id
    }
  }

  updateScore() {
    this.itemTarget.querySelector(".mdc-list-item__graphic").innerText = this.score
  }

  upvote() {
    console.log(`Upvoted, id: ${this.id}`);
    fetch("/upvote", {
      method: "POST",
      body: JSON.stringify(this.payload),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(response => response.json())
      .then(response => this.score = response["score"])
      .catch(error => console.error(`Error: ${error}`))
  }

  downvote() {
    console.log(`Downvoted, id: ${this.id}`);
    fetch("/downvote", {
      method: "POST",
      body: JSON.stringify(this.payload),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(response => response.json())
      .then(response => this.score = response["score"])
      .catch(error => console.error(`Error: ${error}`))
  }
}
