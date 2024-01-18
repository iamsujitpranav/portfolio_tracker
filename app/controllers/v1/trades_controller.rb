module V1
  class TradesController < ApplicationController
    def create
      stock = StockRepository.find(params[:stock_id])
      trade = TradeRepository.create(stock, trade_params)
      render json: { success: true, data: trade.display_trade }
    end

    def update
      trade = TradeRepository.find(params[:id])
      TradeRepository.update(trade, trade_params)
      render json: { success: true, message: 'Trade updated successfully' }
    end

    def destroy
      trade = TradeRepository.find(params[:id])
      TradeRepository.delete(trade)
      render json: { success: true, message: 'Trade removed successfully' }
    end

    private

    def trade_params
      params.require(:trade).permit(:date, :price, :trade_type, :quantity, :stock_id)
    end
  end
end