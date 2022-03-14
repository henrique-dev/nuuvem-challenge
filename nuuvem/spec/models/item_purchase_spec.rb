# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
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

  let(:valid_attributes_for_purchase) do
    {  }
  end

  let(:valid_attributes) do
    { count: 5 }
  end

  subject do
    client = Client.create valid_attributes_for_client
    address = Address.create valid_attributes_for_address
    merchant = Merchant.create valid_attributes_for_merchant.merge(address_id: address.id)
    item = Item.create valid_attributes_for_item.merge(merchant_id: merchant.id)
    purchase = Purchase.create valid_attributes_for_purchase.merge(merchant_id: merchant.id,
                                                                   client_id: client.id)
    described_class.new valid_attributes.merge(item_id: item.id, purchase_id: purchase.id)
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without count' do
      subject.count = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without item' do
      subject.item = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative count' do
      subject.count = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid with zero count' do
      subject.count = 0
      expect(subject).to_not be_valid
    end

    it 'create a item purchase with valid parameters' do
      expect{
        subject.save
      }.to change(ItemPurchase, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
