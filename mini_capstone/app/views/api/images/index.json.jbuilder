json.array! @images.each do |image|
  json.id image.id
  json.url image.url
  json.product image.product
end