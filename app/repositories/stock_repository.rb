class StockRepository
  def self.find(id)
    Stock.where(id: id).last
  end
end
