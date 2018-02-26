json.extract! product_subscriber, :id, :company, :product, :is_manager, :is_payer, :created_at, :updated_at
json.url product_subscriber_url(product_subscriber, format: :json)
