#json.extract! product, :id, :name, :company, :created_at, :updated_at, :product_prices

json.product_id product.id
json.name product.name

product_prices = []
product.product_prices.each do |product_price|
  pp = {}
  pp[:product_price_id] = product_price.id
  pp[:price] = product_price.price
  pp[:price_formatted] = product_price.price_to_f
  pp[:currency_id] = product_price.currency.id
  pp[:currency_name] = product_price.currency.name
  product_prices << pp
end
json.product_prices product_prices

json.url company_product_url(product.company, product, format: :json)
