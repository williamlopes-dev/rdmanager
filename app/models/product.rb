class Product < ApplicationRecord
  belongs_to :company

  validates :company_id, presence: true

  def full_name
    "#{self.name} - #{self.company.full_name}"
  end
end
