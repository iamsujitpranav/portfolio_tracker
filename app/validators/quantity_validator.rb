class QuantityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # This to validate quantity before selling if required quantity is available or not.
    
    return unless record.sell? && value.present? && record.stock.present?
    #check if buy related trades are available for the stock
    unless record.stock.trades.buy.any?
      return record.errors.add(attribute, I18n.t('activerecord.errors.models.trade.attributes.quantity.unavailable_quantity'))
    end

    total_sell_quantity = record.stock.trades.sell.sum(:quantity) + value
    total_buy_quantity = record.stock.trades.buy.sum(:quantity)

    if total_sell_quantity > total_buy_quantity
      record.errors.add(attribute, I18n.t('activerecord.errors.models.trade.attributes.quantity.insufficient_quantity'))
    end
  end
end