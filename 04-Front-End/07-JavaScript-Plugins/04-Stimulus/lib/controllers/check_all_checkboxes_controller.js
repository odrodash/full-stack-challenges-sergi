import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    console.log("The 'check_all_checkboxes' controller is now loaded!");
  }

  checkAll(event) {
    if (event.target.checked === true) {
      this.checkboxTargets.forEach((ele) => {
        ele.checked = true;
      });
    } else {
      this.checkboxTargets.forEach((ele) => {
        ele.checked = false;
      });
    }
  }
}
