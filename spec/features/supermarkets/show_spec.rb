require 'rails_helper'  

RSpec.describe 'supermarket show page' do
  it 'shows supermarkets name and a link to supermarket items index page' do
    soopers = Supermarket.create!(name: "King Soopers", location: "Thornton, CO")
    
    visit "/supermarkets/#{soopers.id}"

    expect(page).to have_content("Welcome to King Soopers!")
    expect(page).to have_link('King Soopers Item Index')
  end
end