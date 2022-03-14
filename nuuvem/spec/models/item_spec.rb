# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:valid_attributes_for_address) do
    { full_address: '185 Avenue Street' }
  end

  let(:valid_attributes_for_merchant) do
    { name: 'Anonimo' }
  end

  let(:valid_attributes) do
    { description: 'Anonimo', price: 0.0 }
  end

  subject do
    address = Address.create valid_attributes_for_address
    merchant = Merchant.create valid_attributes_for_merchant.merge(address_id: address.id)
    described_class.new valid_attributes.merge(merchant_id: merchant.id)
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without merchant' do
      subject.merchant = nil
      expect(subject).to_not be_valid
    end

    it 'create a item with valid parameters' do
      expect{
        subject.save
      }.to change(Item, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
