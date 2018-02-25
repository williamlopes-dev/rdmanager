class ProductSubscriber < ApplicationRecord
  belongs_to :company
  belongs_to :product_price

  validates_uniqueness_of :company_id, scope: :product_price_id
end
