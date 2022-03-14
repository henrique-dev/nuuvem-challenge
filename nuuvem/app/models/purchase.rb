class Purchase < ApplicationRecord
  has_many :item_purchases, class_name: 'ItemPurchase'
  belongs_to :merchant, class_name: 'Merchant'
  belongs_to :client, class_name: 'Client'
end
