class AddPortfolioIdToStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :stocks, :portfolio, null: false, foreign_key: true
  end
end
