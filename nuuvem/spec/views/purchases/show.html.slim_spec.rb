require 'rails_helper'

RSpec.describe "purchases/show", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      count: 2
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/2/)
  # end
end
