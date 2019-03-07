json.array! @products.each do |product|
  json.partial! "product.json.jbuilder", inside_product: product
end