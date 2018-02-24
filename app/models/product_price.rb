class ProductPrice < ApplicationRecord
  belongs_to :product
  belongs_to :currency

  validates :currency, presence: true
  validates :price, presence: true

  def decimal_places
    CompanyCurrency.find_by(company: self.product.company, currency: self.currency).decimal_places
  end

  def full_name
    "#{self.product.name} #{("%.#{decimal_places}f" % (self.price.to_f/(10 ** decimal_places)))} #{self.currency.name} - #{self.product.company.full_name}"
  end

end
