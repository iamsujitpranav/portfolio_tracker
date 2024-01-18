user = User.create!(
  email: 'example@example.com',
  password: 'password',
  password_confirmation: 'password'
)

portfolio = Portfolio.create(name: 'test')

reliance = Stock.create(code: 'RELIANCE', portfolio: portfolio)
hdfcbank = Stock.create(code: 'HDFCBANK', portfolio: portfolio)

reliance_trades = [
  { date: '2015-10-04', price: 900, quantity: 100, trade_type: 'buy' },
  { date: '2015-10-05', price: 1000, quantity: 50, trade_type: 'sell' },
  { date: '2015-10-06', price: 850, quantity: 100, trade_type: 'buy' }
]

hdfcbank_trades = [
  { date: '2015-11-05', price: 1000, quantity: 200, trade_type: 'buy' },
  { date: '2015-12-07', price: 800, quantity: 100, trade_type: 'sell' }
]

reliance_trades.each do |trade_params|
  reliance.trades.create(trade_params)
end

hdfcbank_trades.each do |trade_params|
  hdfcbank.trades.create(trade_params)
end
