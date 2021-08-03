import { Controller } from "stimulus";

export default class extends Controller {
  static values = { patient: Number };
  connect() {
    console.log("hello from items");
  }

  fetchTaskItems(e) {
    const id = e.target.value;
    console.log(id);

    $.ajax({
      type: "GET",
      url: `/patients/${this.patientValue}/task/lists/new.js`,
      data: { list_id: id },
    });
  }
}
