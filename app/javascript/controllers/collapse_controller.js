import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("connected");
  }

  collapseTarget(e) {
    const target = e.target.dataset.target;
    console.log(target);

    $(target).collapse("toggle");
  }
}
