class PurchasesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "purchases_channel"
  end

  def get_updates

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
