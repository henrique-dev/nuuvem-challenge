# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:valid_attributes) do
    { name: 'Anonimo' }
  end

  subject do
    described_class.new valid_attributes
  end

  context 'only the model' do
    it 'is valid with valid parameters' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'create a client with valid parameters' do
      expect{
        subject.save
      }.to change(Client, :count).by(1)
    end
  end

  context 'associations' do
  end

  context 'scopes' do
  end

  context 'methods' do
  end
end
