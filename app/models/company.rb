class Company < ApplicationRecord
  has_many :products

  validates :cnpj, presence: true
  validates :name, presence: true

  def full_name
    "#{self.name} (#{self.cnpj})"
  end

end
