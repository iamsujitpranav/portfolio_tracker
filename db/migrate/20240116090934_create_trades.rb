class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.date :date
      t.float :price
      t.integer :quantity
      t.string :trade_type
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
