class Trade < ApplicationRecord
  belongs_to :stock

  validates :date, :price, :trade_type, :quantity, presence: true
  validates :trade_type, inclusion: { in: %w[buy sell] }

  scope :buy_trades, -> { where(trade_type: 'buy') }
  
  def display_trade
    "#{trade_type.upcase} #{quantity}@#{price} #{date.strftime('%m/%d/%Y')}"
  end

end
