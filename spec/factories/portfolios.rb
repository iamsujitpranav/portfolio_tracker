FactoryBot.define do
  factory :portfolio do
    name { 'Sample Portfolio' }

        
    trait :with_stock_and_trades do
      after(:create) do |portfolio|
        create(:stock, :with_trades, portfolio: portfolio)
      end
    end
  end
end
