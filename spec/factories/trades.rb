FactoryBot.define do
  factory :trade do
    stock
    date { '2022-01-01' } # Adjust as needed
    price { 100 }
    trade_type { 'buy' } # or 'sell'
    quantity { 10 }
  end
end