get '/shop' do
  @categories = Category.all.to_a
  erb :shop
end
