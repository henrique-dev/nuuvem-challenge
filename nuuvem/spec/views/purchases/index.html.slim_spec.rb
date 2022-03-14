require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        count: 2
      ),
      Purchase.create!(
        count: 2
      )
    ])
  end

  # it "renders a list of purchases" do
  #   render
  #   assert_select "tr>td", text: 2.to_s, count: 2
  # end
end
