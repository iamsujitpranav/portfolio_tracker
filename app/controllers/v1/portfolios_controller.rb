module V1
  class PortfoliosController < ApplicationController
    before_action :set_portfolio

    def show
      stocks = @portfolio.try(:stocks)
      trades = @portfolio.try(:trades)

      render json: {message: "Success", status: 200, stocks: stocks, trades: trades}
    end

    def holdings      
      holdings = portfolio_service.holdings
      render json: {message: "Success", status: 200, holdings: holdings}
    end

    def returns
      returns = portfolio_service.cumulative_returns
      render json: {message: "Success", status: 200, returns: returns}
    end

    def index
      portfolios = Portfolio.all
      render json: {message: "Success", status: 200, portfolios: portfolios}
    end


    private

    def set_portfolio
      #Repositories encapsulate the logic for interacting with the data storage, such as databases, behind an abstraction layer.
      @portfolio = PortfolioRepository.find(params[:id]) 
    end

    def portfolio_service
      #Used SOA(Service Oriented Architecture) to encapsulate code
      PortfolioService.new(@portfolio) 
    end
  end
end
