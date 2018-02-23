class Company < ApplicationRecord
  validates :cnpj, presence: true
  validates :name, presence: true
end
