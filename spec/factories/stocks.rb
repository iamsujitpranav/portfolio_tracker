FactoryBot.define do
  factory :stock do
    code { 'AAPL' } # Adjust as needed
    portfolio

    trait :with_trades do
      after(:create) do |stock|
        create_list(:trade, 2, stock: stock, trade_type: 'buy')
        create_list(:trade, 1, stock: stock, trade_type: 'sell')
      end
    end
  end
end