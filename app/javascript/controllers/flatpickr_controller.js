import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("Flatpickr controller is connected");
    console.log(this.element);
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  }
}
