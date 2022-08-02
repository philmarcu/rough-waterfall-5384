class Item < ApplicationRecord
  has_many :customer_items
  has_many :customers, through: :customer_items
  has_many :supermarket_items
  has_many :supermarkets, through: :supermarket_items
  def self.total_price
    sum(:price)
  end
end