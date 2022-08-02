require 'rails_helper'

RSpec.describe SupermarketItem do
  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :supermarket }
  end
end