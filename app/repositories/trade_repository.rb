class TradeRepository

  def self.find(id)
    Trade.where(id: id).last
  end

  def self.create(stock, trade_params)
    stock.trades.create(trade_params)
  end

  def self.update(trade, trade_params)
    trade.update(trade_params)
  end

  def self.delete(trade)
    trade.destroy
  end
end