module V1
  class TradesController < ApplicationController

    before_action :set_trade, only: [:update, :destroy]

    def create
      stock = StockRepository.find(params[:stock_id])
      @trade = TradeRepository.create(stock, trade_params)

      render_response
    end

    def update
      TradeRepository.update(@trade, trade_params)

      render_response
    end

    def destroy
      TradeRepository.delete(@trade)

      render_response
    end

    private

    def trade_params
      params.require(:trade).permit(:date, :price, :trade_type, :quantity, :stock_id)
    end

    def set_trade
      #Repositories encapsulate the logic for interacting with the data storage, such as databases, behind an abstraction layer.
      @trade = TradeRepository.find(params[:id])
    end

    def render_response
      action = params[:action] == "destroy" ? "delete" : params[:action]

      if @trade.errors.present?
        status, data, message = false, @trade.errors.messages, "#{action} unsuccessful."
      else
        status, data, message = true, @trade.display_trade, "Trade #{action}d successfully."
      end

      render json: { success: status, data: data, message: message }
    end
  end
end