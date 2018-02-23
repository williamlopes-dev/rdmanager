class ProductSubscriber < ApplicationRecord
  belongs_to :company
  belongs_to :currency
  belongs_to :product_price
end
