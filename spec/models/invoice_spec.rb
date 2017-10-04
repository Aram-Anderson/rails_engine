require 'rails_helper'

RSpec.describe Invoice, type: :model do
  xcontext 'Instance Methods' do
    it 'finds the most expensive' do
      create(:invoice)
      
      expect(Invoice.most_expensive(3)).to eq(3)
    end
  end
end
