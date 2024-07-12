json.extract! product, :id, :description, :long_description, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
