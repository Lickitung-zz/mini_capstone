json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price.to_i
  json.description product.description
  json.image_url product.image_url
end