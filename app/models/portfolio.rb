class Portfolio < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :trades, through: :stocks
end
