class Item < ApplicationRecord
  validates_presence_of :description, :price

  has_many :item_purchases, class_name: 'ItemPurchase'
  belongs_to :merchant, class_name: 'Merchant'
end
