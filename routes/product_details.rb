get '/shop/:category/:item/details' do
  item = Product.find(params['item'])
  # hash of attributes
  @attributes = item.attributes
  # array of comments
  @comments   = item.comments
  # array of categories
  @category   = item.category
  erb :product_details
end
