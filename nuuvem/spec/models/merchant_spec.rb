# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:valid_attributes_for_address) do
    { full_address: '185 Avenue Street' }
  end

  let(:valid_attributes) do
    { name: 'Anonimo' }
  end

  subject do
    address = Address.create valid_attributes_for_address
    described_class.new valid_attributes.merge(address_id: address.id)
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it 'create a item with valid parameters' do
      expect{
        subject.save
      }.to change(Merchant, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
