class CompanyCurrency < ApplicationRecord
  belongs_to :company
  belongs_to :currency
end
