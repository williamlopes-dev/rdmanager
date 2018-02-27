class Product < ApplicationRecord
  belongs_to :company
  has_many :product_prices, inverse_of: :product, dependent: :destroy

  accepts_nested_attributes_for :product_prices, reject_if: :all_blank, allow_destroy: true

  validates :company_id, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :company_id

  before_validation do
    product_prices.map do |e|
      ids = product_prices.collect(&:currency_id).compact
      ids_counted = ids.inject({}) { |hash, c_id| hash[c_id] = (hash[c_id] || 0) + 1; hash }
      duplicate_c_ids = ids_counted.select { |k, v| v > 1 }.keys
      e.instance_variable_set "@duplicate_currencies", duplicate_c_ids
    end
  end

  def full_name
    "#{self.name} - #{self.company.full_name}"
  end

end
