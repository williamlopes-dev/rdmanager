class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :company_currencies, inverse_of: :company, dependent: :destroy
  has_many :currencies, through:  :company_currencies

  accepts_nested_attributes_for :company_currencies, reject_if: :all_blank, allow_destroy: true

  validates :cnpj, presence: true
  validates :name, presence: true

  def full_name
    "#{self.name} (#{self.cnpj})"
  end

end
