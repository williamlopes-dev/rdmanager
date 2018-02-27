class ProductSubscriber < ApplicationRecord
  belongs_to :company
  belongs_to :product_price

  validates :company, presence: true
  validates :product_price, presence: true
  validates_uniqueness_of :company_id, scope: :product_price_id
  validate :ensure_some_role_is_checked

  def ensure_some_role_is_checked
    if not is_manager and not is_payer
      errors.add(:company, "should be select some role")
    end
  end

end
