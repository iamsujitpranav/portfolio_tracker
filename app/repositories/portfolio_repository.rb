class PortfolioRepository
  def self.find(id)
    Portfolio.where(id: id).last
  end
end
