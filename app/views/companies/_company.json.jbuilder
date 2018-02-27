#json.extract! company, :id, :cnpj, :name, :created_at, :updated_at, :company_currencies

json.company_id company.id
json.name company.name
json.cnpj company.cnpj

company_currencies = []
company.company_currencies.each do |company_currency|
  cc = {}
  cc[:company_currency_id] = company_currency.id
  cc[:currency_id] = company_currency.currency.id
  cc[:name] = company_currency.currency.name
  cc[:decimal_places] = company_currency.decimal_places
  company_currencies << cc
end
json.company_currencies company_currencies

json.url company_url(company, format: :json)
