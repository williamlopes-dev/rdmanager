# json.array! @products, partial: 'products/product', as: :product
json.company_id @company.id
json.name @company.name
json.cnpj @company.cnpj
json.url company_url(@company, format: :json)
json.products @products, partial: 'products/product', as: :product
