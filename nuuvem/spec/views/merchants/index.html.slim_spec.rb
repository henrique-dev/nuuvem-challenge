require 'rails_helper'

RSpec.describe "merchants/index", type: :view do
  before(:each) do
    address = Address.create!(
      full_address: "Full Address"
    )
    assign(:merchants, [
      Merchant.create!(
        name: "Name",
        address_id: address.id
      ),
      Merchant.create!(
        name: "Name",
        address_id: address.id
      )
    ])
  end

  it "renders a list of merchants" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
