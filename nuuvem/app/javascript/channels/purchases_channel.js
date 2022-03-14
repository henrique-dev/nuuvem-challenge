import consumer from "./consumer"

consumer.subscriptions.create("PurchasesChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    jQuery("#main_container").empty().append(data.html);
    jQuery("#total_gross").empty().append(data.total)
    jQuery("#partial_total_gross").empty().append(data.last_total)
  }
});
