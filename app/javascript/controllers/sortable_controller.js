import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { post } from "@rails/request.js";

export default class extends Controller {
  static values = { url: String };

  connect() {
    this.initSortable();
  }

  initSortable() {
    if (this.sortable) {
      this.sortable.destroy();
    }

    this.sortable = Sortable.create(this.element, {
      animation: 150,
      handle: ".handle",
      dataIdAttr: "data-id",
      ghostClass: "sortable-ghost",
      chosenClass: "sortable-chosen",
      dragClass: "sortable-drag",
      onStart: (event) => {
        document.body.style.cursor = "grabbing";
      },
      onEnd: (event) => {
        document.body.style.cursor = "";
        const serialized = this.sortable.toArray();
        this.postData(serialized);
      },
    });
  }

  disconnect() {
    if (this.sortable) {
      this.sortable.destroy();
    }
  }

  async postData(serialized) {
    const url = this.urlValue;

    const response = await post(url, {
      body: JSON.stringify(serialized),
      headers: {
        "Content-Type": "application/json",
      },
    });
    if (response.ok) {
    } else {
      console.error("Sorting failed", response);
    }
  }
}
