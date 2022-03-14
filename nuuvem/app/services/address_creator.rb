# frozen_string_literal: true

# Documentation
class AddressCreator

  def initialize(full_address:, code:)
    @full_address = full_address
    @code = code
  end

  def self.call(**args)
    new(**args).create_address
  end

  def call
    create_address
  end

  def create_address
    unless (address = Address.find_by(name: @name, code: @code))
      address = Address.create(name: @name, code: @code)
    end
    address
  end
end
