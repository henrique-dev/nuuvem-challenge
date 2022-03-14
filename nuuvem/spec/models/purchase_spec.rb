# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:valid_attributes_for_address) do
    { full_address: '185 Avenue Street' }
  end

  let(:valid_attributes_for_merchant) do
    { name: 'Anonimo' }
  end

  let(:valid_attributes_for_client) do
    { name: 'Anonimo' }
  end

  let(:valid_attributes_for_item) do
    { description: 'A precious item', price: 0.0 }
  end

  let(:valid_attributes) do
    {  }
  end

  subject do
    address = Address.create valid_attributes_for_address
    merchant = Merchant.create valid_attributes_for_merchant.merge(address_id: address.id)
    client = Client.create valid_attributes_for_client
    described_class.new valid_attributes.merge(merchant_id: merchant.id, client_id: client.id)
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without merchant' do
      subject.merchant_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without client' do
      subject.client = nil
      expect(subject).to_not be_valid
    end

    it 'create a purchase with valid parameters' do
      expect{
        subject.save
      }.to change(Purchase, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
