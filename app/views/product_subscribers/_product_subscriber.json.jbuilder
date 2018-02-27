#json.extract! product_subscriber, :id, :company, :product_price, :is_manager, :is_payer, :created_at, :updated_at

json.product_subscriber_id product_subscriber.id

company = {}
company[:company_id] = product_subscriber.company.id
company[:name] = product_subscriber.company.name
company[:cnpj] = product_subscriber.company.cnpj
json.company company

product_price = {}
product_price[:product_price_id] = product_subscriber.product_price.id
product_price[:product_id] = product_subscriber.product_price.product.id
product_price[:product_name] = product_subscriber.product_price.product.name
product_price[:price] = product_subscriber.product_price.price
product_price[:price_formatted] = product_subscriber.product_price.price_to_f
product_price[:currency_id] = product_subscriber.product_price.currency.id
product_price[:currency_name] = product_subscriber.product_price.currency.name
product_price[:company] = {}
product_price[:company][:company_id] = product_subscriber.product_price.product.company.id
product_price[:company][:name] = product_subscriber.product_price.product.company.name
product_price[:company][:cnpj] = product_subscriber.product_price.product.company.cnpj
json.product_price product_price

json.is_manager product_subscriber.is_manager
json.is_payer product_subscriber.is_payer
json.url product_subscriber_url(product_subscriber, format: :json)
