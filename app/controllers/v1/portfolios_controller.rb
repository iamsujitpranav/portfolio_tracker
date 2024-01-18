module V1
  class PortfoliosController < ApplicationController
    before_action :set_portfolio

    def show
      
      stocks = @portfolio.try(:stocks)
      trades = @portfolio.try(:trades)

      render json: {message: "Success", status: 200, stocks: stocks, trades: trades}
    end

    def holdings
      holdings = PortfolioService.get_holdings(@portfolio)
      
      render json: {message: "Success", status: 200, holdings: holdings}
    end

    def returns
      returns = PortfolioService.get_cumulative_returns(@portfolio)

      render json: {message: "Success", status: 200, returns: returns}
    end

    def index
      portfolios = Portfolio.all
      render json: {message: "Success", status: 200, portfolios: portfolios}
    end


    private

    def set_portfolio
      @portfolio = PortfolioRepository.find(params[:id])
    end

  end
end