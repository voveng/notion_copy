import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { post } from "@rails/request.js";

export default class extends Controller {
  static Values = { sortUrl: String };

  connect() {
    this.initSortable();
  }
  
  initSortable() {
    // Destroy existing sortable instance if it exists
    if (this.sortable) {
      this.sortable.destroy();
    }
    
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      handle: ".handle",
      dataIdAttr: "data-id",  // Use data-id attribute to identify items
      ghostClass: "sortable-ghost", // Class name for the drop placeholder
      chosenClass: "sortable-chosen", // Class name for the chosen item
      dragClass: "sortable-drag", // Class name for the dragged element
      onChoose: (event) => {
        console.log("Item chosen for dragging", event.item);
      },
      onStart: (event) => {
        console.log("Drag started", event.item);
        // Set cursor to grabbing when drag starts
        document.body.style.cursor = 'grabbing';
      },
      onEnd: (event) => {
        console.log("Drag ended", event.item, event.newIndex, event.oldIndex);
        // Reset cursor when drag ends
        document.body.style.cursor = '';
        const serialized = this.sortable.toArray();
        console.log("sortable", serialized);
        this.postData(serialized);
      },
    });
    console.log("sortable", this.sortable);
  }
  
  disconnect() {
    // Clean up sortable instance when controller disconnects
    if (this.sortable) {
      this.sortable.destroy();
    }
  }

  async postData(serialized) {
    const url = this.sortUrlValue;

    const response = await post(url, {
      body: JSON.stringify(serialized),
      headers: {
        "Content-Type": "application/json",
      },
    });
    if (response.ok) {
      console.log("response", response);
    } else {
      console.error("Sorting failed", response);
    }
  }
}
