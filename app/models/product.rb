class Product < ApplicationRecord
  belongs_to :company
  has_many :product_prices, inverse_of: :product, dependent: :destroy

  accepts_nested_attributes_for :product_prices, reject_if: :all_blank, allow_destroy: true

  validates :company_id, presence: true

  def full_name
    "#{self.name} - #{self.company.full_name}"
  end
end
