class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :company_currencies, inverse_of: :company, dependent: :destroy
  has_many :currencies, through:  :company_currencies

  accepts_nested_attributes_for :company_currencies, reject_if: :all_blank, allow_destroy: true

  validates :cnpj, presence: true
  validates :name, presence: true
  validates_uniqueness_of :cnpj
  validate :cnpj_must_be_valid

  before_validation do
    company_currencies.map do |e|
      ids = company_currencies.collect(&:currency_id).compact
      ids_counted = ids.inject({}) { |hash, c_id| hash[c_id] = (hash[c_id] || 0) + 1; hash }
      duplicate_c_ids = ids_counted.select { |k, v| v > 1 }.keys
      e.instance_variable_set "@duplicate_currencies", duplicate_c_ids
    end
  end

  def cnpj_must_be_valid
    unless /[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}/.match(cnpj)
      errors.add(:cnpj, "format is not valid")
    end
  end

  def full_name
    "#{self.name} (#{self.cnpj})"
  end

  def managed_by
    product_subscribers = ProductSubscriber.where(company: self, is_manager: true)
    grouped_by_currency = {}
    product_subscribers.each do |product_subscriber|
      grouped_by_currency ||= {}
      (grouped_by_currency[product_subscriber.product_price.currency] ||= []) << product_subscriber
    end
    grouped_by_currency
  end

  def payed_by
    product_subscribers = ProductSubscriber.where(company: self, is_payer: true)
    grouped_by_currency = {}
    product_subscribers.each do |product_subscriber|
      grouped_by_currency ||= {}
      (grouped_by_currency[product_subscriber.product_price.currency] ||= []) << product_subscriber
    end
    grouped_by_currency
  end

end
