class Address < ApplicationRecord
  validates_presence_of :full_address

  has_many :clients, class_name: 'Client'
  has_many :merchants, class_name: 'Merchant'
end
