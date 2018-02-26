class ProductSubscriber < ApplicationRecord
  belongs_to :company
  belongs_to :product_price

  validates :company, presence: true
  validates :product_price, presence: true
  validates_uniqueness_of :company_id, scope: :product_price_id

  def product
    {
      product_id: self.product_price.product.id,
      product_name: self.product_price.product.name,
      price: self.product_price.price_to_f,
      currency_id: self.product_price.currency.id,
      currency_name: self.product_price.currency.name,
      created_at: self.product_price.created_at,
      updated_at: self.product_price.updated_at
    }
  end

end
