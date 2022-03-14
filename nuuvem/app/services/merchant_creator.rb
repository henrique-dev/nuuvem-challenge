# frozen_string_literal: true

# Documentation
class MerchantCreator

  def initialize(name:, full_address:)
    @name = name
    @full_address = full_address
  end

  def self.call(**args)
    new(**args).create_merchant
  end

  def call
    create_merchant
  end

  def create_merchant
    unless (merchant = Merchant.find_by(name: @name))
      address = Address.create(full_address: @full_address)
      merchant = Merchant.create(name: @name, address_id: address.id)
    end
    merchant
  end
end
