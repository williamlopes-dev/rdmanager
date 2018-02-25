class Currency < ApplicationRecord
  validates_uniqueness_of :name
end
