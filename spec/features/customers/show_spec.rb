require 'rails_helper'

RSpec.describe 'customer show page' do
  it 'shows list of items & supermarket customer belongs to' do
    soopers = Supermarket.create!(name: "King Soopers", location: "Thornton, CO")
    bob = soopers.customers.create!(name: "Bobby Balintino")
    cookies = bob.items.create!(name: "Oreos", price: 450)
    chips = bob.items.create!(name: "Pringles", price: 310)
    cream = bob.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)

    visit "/customers/#{bob.id}"

    expect(page).to have_content("King Soopers Customer - Bobby Balintino")

    within "#items-#{cookies.id}" do
      expect(page).to have_content("Oreos - $4.50")
      expect(page).to_not have_content("Pringles - $3.10")
    end

    within "#items-#{chips.id}" do
      expect(page).to have_content("Pringles - $3.10")
      expect(page).to_not have_content("Chocolate Ice Cream Gallon - $7.00")
    end

    within "#items-#{cream.id}" do
      expect(page).to have_content("Chocolate Ice Cream Gallon - $7.00")
      expect(page).to_not have_content("Oreos - #4.50")
    end
  end
end