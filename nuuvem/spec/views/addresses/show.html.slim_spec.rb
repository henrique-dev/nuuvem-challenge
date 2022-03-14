require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      full_address: "Full Address"
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Full Address/)
  # end
end
