require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    address = Address.create!(full_address: 'Full address')
    merchant = Merchant.create!(name: 'Merchant', address_id: address.id)
    assign(:items, [
      Item.create!(
        description: "Description",
        price: 0.0,
        merchant_id: merchant.id
      ),
      Item.create!(
        description: "Description",
        price: 0.0,
        merchant_id: merchant.id
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
