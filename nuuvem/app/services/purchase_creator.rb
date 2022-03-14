# frozen_string_literal: true

# Documentation
class PurchaseCreator

  def initialize(client:, merchant:)
    @client = client
    @merchant = merchant
  end

  def self.call(**args)
    new(**args).create_purchase
  end

  def call
    create_purchase
  end

  def create_purchase
    Purchase.create(client_id: @client.id, merchant_id: @merchant.id)
  end
end
