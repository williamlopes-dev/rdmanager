class CompanyCurrency < ApplicationRecord
  belongs_to :company
  belongs_to :currency

  validates_uniqueness_of :company_id, scope: :currency_id
  validates :decimal_places, presence: true
  validate :ensure_unique_currency_per_company

  def ensure_unique_currency_per_company
    if @duplicate_currencies.present? and @duplicate_currencies.include?(currency_id)
      errors.add(:currency_id, "cannot be duplicated")
    end
  end

end
