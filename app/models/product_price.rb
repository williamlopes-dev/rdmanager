class ProductPrice < ApplicationRecord
  belongs_to :product
  belongs_to :currency

  validates :product_id, presence: true
  validates :currency_id, presence: true

  def full_name
    decimal = CompanyCurrency.find_by(company_id: 1, currency_id: 1)
    "#{self.product.name} #{("%.2f" % (self.price/(10 ** decimal.decimal_places)))} #{self.currency.name} - #{self.product.company.full_name}"
  end

end
