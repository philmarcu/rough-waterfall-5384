require 'rails_helper'

RSpec.describe 'supermarket index page' do
  it 'lists all unique items a supermarket has' do
    soopers = Supermarket.create!(name: "King Soopers", location: "Thornton, CO")
    cookies = soopers.items.create!(name: "Oreos", price: 450)
    chips = soopers.items.create!(name: "Pringles", price: 310)
    cream = soopers.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)
    cream_2 = soopers.items.create!(name: "Chocolate Ice Cream Gallon", price: 700)

    visit "/supermarkets/#{soopers.id}/items"

    expect(page).to have_content("King Soopers Index Page")

    within "#items-#{cookies.id}" do
      expect(page).to have_content("Oreos - $4.50")
      expect(page).to_not have_content("Pringles - $3.10")
    end

    within "#items-#{chips.id}" do
      expect(page).to have_content("Pringles - $3.10")
      expect(page).to_not have_content("Oreos - $4.50")
    end

    within "#items-#{cream.id}" do
      expect(page).to have_content("Chocolate Ice Cream Gallon - $7.00")
      expect(page).to_not have_content("Oreos - $4.50")
    end
  end
end

# not sure how to set up test to show only unique name showing on feature page - have model test though