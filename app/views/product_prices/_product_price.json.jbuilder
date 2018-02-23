json.extract! product_price, :id, :product_id, :currency_id, :price, :created_at, :updated_at
json.url product_price_url(product_price, format: :json)
