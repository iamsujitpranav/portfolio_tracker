class PortfolioService
  def self.get_holdings(portfolio)
    # Calculate holdings logic based on the provided guideline
    holdings = {}
    portfolio.stocks.each do |stock|
      total_quantity = stock.trades.buy_trades.sum(:quantity)
      avg_price = stock.trades.buy_trades.sum { |trade| trade.price * trade.quantity } / total_quantity.to_f
      holdings[stock.id] = { quantity: total_quantity, avg_price: avg_price }
    end
    holdings
  end

  def self.get_cumulative_returns(portfolio)
    # Calculate cumulative returns logic based on the provided guideline
    returns = {}
    portfolio.stocks.each do |stock|
      initial_investment = stock.trades.buy_trades.sum { |trade| trade.price * trade.quantity }
      final_value = stock.trades.sum { |trade| trade.price * trade.quantity }
      returns[stock.id] = final_value - initial_investment
    end
    returns
  end
end
