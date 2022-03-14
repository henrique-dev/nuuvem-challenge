require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      full_address: "MyString"
    ))
  end

  # it "renders the edit address form" do
  #   render

  #   assert_select "form[action=?][method=?]", address_path(@address), "post" do

  #     assert_select "input[name=?]", "address[full_address]"
  #   end
  # end
end
