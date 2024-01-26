class Trade < ApplicationRecord

  enum trade_type: {buy: 'buy', sell: 'sell'}

  belongs_to :stock

  validates :date, :price, :trade_type, :quantity, presence: true
  validates :trade_type, inclusion: { in: %w[buy sell] }
  
  validates :quantity, presence: true, quantity: true


  def display_trade
    "#{trade_type.upcase} #{quantity}@#{price} #{date.strftime('%m/%d/%Y')}"
  end

end
