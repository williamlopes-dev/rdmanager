json.extract! product, :id, :name, :company, :created_at, :updated_at, :prices_by_currency
json.url company_products_url(product, format: :json)
