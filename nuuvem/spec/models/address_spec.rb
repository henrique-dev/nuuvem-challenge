# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:valid_attributes) do
    { full_address: 'Base de TESTE' }
  end

  subject do
    described_class.new valid_attributes
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without full_address' do
      subject.full_address = nil
      expect(subject).to_not be_valid
    end

    it 'create a address with valid parameters' do
      expect{
        subject.save
      }.to change(Address, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
