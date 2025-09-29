import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { post } from "@rails/request.js";

export default class extends Controller {
  static targets = ["root"];
  static values = { sortUrl: String };

  connect() {
    const nestedSortables = this.element.querySelectorAll(".nested-sortable");
    nestedSortables.forEach((sortable) => {
      new Sortable(sortable, {
        group: "nested",
        animation: 150,
        fallbackOnBody: true,
        swapThreshold: 0.65,
        onEnd: this.onEnd.bind(this),
      });
    });
  }

  onEnd(event) {
    const serialized = this.serialize(this.rootTarget.querySelector('.nested-sortable'));
    this.postData(serialized);
  }

  serialize(sortable) {
    return Array.from(sortable.children)
      .filter(child => child.dataset.sortableId)
      .map((child) => {
        const nestedSortable = child.querySelector(".nested-sortable");
        return {
          id: child.dataset.sortableId,
          children: nestedSortable ? this.serialize(nestedSortable) : [],
        };
      });
  }

  async postData(serialized) {
    const url = this.sortUrlValue;
    await post(url, {
      body: { pages: serialized },
      responseKind: "json",
    });
  }
}