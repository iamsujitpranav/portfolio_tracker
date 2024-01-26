class PortfolioService
  attr_reader :portfolio

  def initialize(portfolio)
    @portfolio = portfolio
  end

  # Public method to calculate holdings for each stock
  def holdings
    holdings = {}

    stocks.each do |stock|
      trades = buy_trades(stock)
      total_quantity = trades.sum(:quantity)
      avg_price = calculate_average_price(trades)
      holdings[stock.id] = { code: stock.code, quantity: total_quantity, avg_price: avg_price }
    end

    holdings
  end

  # Public method to calculate cumulative returns for each stock
  def cumulative_returns
    returns = {}

    stocks.each do |stock|
      initial_investment = calculate_initial_investment(stock)
      final_value = stock.trades.sum { |trade| trade.price * trade.quantity }
      returns[stock.id] = final_value - initial_investment
    end

    returns
  end

  private

  # Private method to retrieve buy trades for a given stock
  def buy_trades(stock)
    stock.trades.buy
  end

  # Private method to retrieve all stocks in the portfolio
  def stocks
    portfolio.stocks
  end

  # Private method to calculate the average price for a set of trades
  def calculate_average_price(trades)
    total_quantity = trades.sum(:quantity)
    return 0.0 if total_quantity.zero?

    trades.sum { |trade| trade.price * trade.quantity } / total_quantity.to_f
  end

  # Private method to calculate the initial investment for a stock
  def calculate_initial_investment(stock)
    buy_trades(stock).sum { |trade| trade.price * trade.quantity }
  end
end
