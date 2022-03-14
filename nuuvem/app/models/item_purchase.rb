class ItemPurchase < ApplicationRecord
  validates_presence_of :count
  validates :count, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :purchase, class_name: 'Purchase'
  belongs_to :item, class_name: 'Item'
end
