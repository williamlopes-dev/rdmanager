class ProductSubscriber < ApplicationRecord
  belongs_to :company
  belongs_to :product_price
end
