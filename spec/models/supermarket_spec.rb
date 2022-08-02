require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many :supermarket_items }
    it { should have_many(:customer_items).through(:customers)}
    it { should have_many(:items).through(:supermarket_items) }
  end
end