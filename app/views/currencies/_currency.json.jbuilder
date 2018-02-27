#json.extract! currency.to_json, :id, :name, :created_at, :updated_at

json.currency_id currency.id
json.name currency.name
json.url currency_url(currency, format: :json)
