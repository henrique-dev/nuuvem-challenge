class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :purchases, class_name: 'Purchase'
  belongs_to :address, class_name: 'Address'
end
