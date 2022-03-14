require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        full_address: "Full Address"
      ),
      Address.create!(
        full_address: "Full Address"
      )
    ])
  end

  # it "renders a list of addresses" do
  #   render
  #   assert_select "tr>td", text: "Full Address".to_s, count: 2
  # end
end
