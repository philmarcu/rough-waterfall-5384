class Supermarket < ApplicationRecord
  has_many :customers
  has_many :customer_items, through: :customers
  has_many :supermarket_items
  has_many :items, through: :supermarket_items
end