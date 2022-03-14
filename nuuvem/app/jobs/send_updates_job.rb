# frozen_string_literal: true

# Documentation
class SendUpdatesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @item_purchases = ItemPurchase.page(1)
    @last_total = FileUpload.last&.total || '0.00'
    @total = FileUpload.sum(:total) || '0.00'
    ActionCable.server.broadcast 'purchases_channel', {
      html: ActionController::Base.new.render_to_string(partial: 'purchases/purchases', locals: { item_purchases: @item_purchases }),
      last_total: format('%.2f', @last_total),
      total: format('%.2f', @total)
    }
  end
end
