# json.partial! "products/product", product: @product

json.company_id @product.company.id
json.name @product.company.name
json.cnpj @product.company.cnpj
json.product @product, partial: "products/product", as: :product
