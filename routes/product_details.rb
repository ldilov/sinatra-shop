get '/shop/:category/:item/details'  do
  item = Product.find(params['item'])
  # hash of attributes
  @attributes = item.attributes
  # array of comments
  @comments   = item.get_comments
  # array of categories
  @category   = item.get_category
  erb :product_details
end
