# frozen_string_literal: true

# Documentation
class ItemCreator < ApplicationService

  def initialize(description:, price:, merchant:)
    @description = description
    @price = price
    @merchant = merchant
  end

  def call
    create_item
  end

  def create_item
    unless (item = Item.find_by(description: @description, merchant_id: @merchant.id))
      item = Item.create(description: @description, merchant_id: @merchant.id, price: @price)
    end
    item
  end
end
