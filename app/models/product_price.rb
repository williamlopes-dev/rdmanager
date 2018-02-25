class ProductPrice < ApplicationRecord
  belongs_to :product
  belongs_to :currency

  validates :currency, presence: true
  validates :price, presence: true
  validate :ensure_unique_currency_per_product_price

   def ensure_unique_currency_per_product_price
     if @duplicate_currencies.present? and @duplicate_currencies.include?(currency_id)
       errors.add(:currency_id, "cannot be duplicated")
     end
   end

  def decimal_places
    CompanyCurrency.find_by(company: self.product.company, currency: self.currency).decimal_places
  end

  def full_name
    "#{self.product.name} #{price_formatted} #{self.currency.name} - #{self.product.company.full_name}"
  end

  def price_formatted
    "#{("%.#{decimal_places}f" % (self.price.to_f/(10 ** decimal_places)))} #{self.currency.name}"
  end

  def price_to_f
    self.price.to_f/(10 ** decimal_places)
  end

end
