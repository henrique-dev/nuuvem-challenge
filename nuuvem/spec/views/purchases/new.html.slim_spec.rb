require 'rails_helper'

RSpec.describe "purchases/new", type: :view do
  before(:each) do
    assign(:purchase, Purchase.new(
      count: 1
    ))
  end

  # it "renders new purchase form" do
  #   render

  #   assert_select "form[action=?][method=?]", purchases_path, "post" do

  #     assert_select "input[name=?]", "purchase[count]"
  #   end
  # end
end
