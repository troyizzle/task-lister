import { Controller } from "stimulus";

export default class extends Controller {
  static values = { url: String };
  connect() {
    console.log("hello from patient");
  }

  completeTask() {
    $.ajax({
      type: "GET",
      url: `${this.urlValue}.js`,
    });
  }
}
