require 'rails_helper'

RSpec.describe Item do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many :supermarket_items}
    it { should have_many(:customers).through(:customer_items)}
    it { should have_many(:supermarkets).through(:supermarket_items)}
  end

  describe '.class methods' do
    describe '.total_price' do
      it 'can get the total price of items' do
        soopers = Supermarket.create!(name: "King Soopers", location: "Thornton, CO")
        bob = soopers.customers.create!(name: "Bobby Balintino")
        cookies = bob.items.create!(name: "Oreos", price: 450)
        chips = bob.items.create!(name: "Pringles", price: 310)
        cream = bob.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)

        expect(Item.total_price).to eq(1460)
      end

      it 'returns only unique named items' do
        soopers = Supermarket.create!(name: "King Soopers", location: "Thornton, CO")
        bob = soopers.customers.create!(name: "Bobby Balintino")
        cookies = bob.items.create!(name: "Oreos", price: 450)
        chips = bob.items.create!(name: "Pringles", price: 310)
        cream = bob.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)
        cream_2 = bob.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)
        
        expect(Item.unique).to eq([cream, cookies, chips])
      end
    end
  end
end