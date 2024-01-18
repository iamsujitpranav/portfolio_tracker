require 'rails_helper'

RSpec.describe Trade, type: :model do
  it 'creates a trade' do
    trade = create(:trade)
    expect(trade).to be_valid
  end
end
