# frozen_string_literal: true

# Documentation
class ItemPurchaseCreator

  def initialize(count:, item:, purchase:)
    @count = count
    @item = item
    @purchase = purchase
  end

  def self.call(**args)
    new(**args).create_item_purchase
  end

  def call
    create_item_purchase
  end

  def create_item_purchase
    ItemPurchase.create(count: @count, item_id: @item.id, purchase_id: @purchase.id)
  end
end
