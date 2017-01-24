get '/cart' do
  404 if session[:logged_in]
  @user = User.find(session[:userid])

  if @user.cart_items.empty?
    flash[:error] = 'Няма продукти в кошницата.'
  else
    # @items is [[item, quantity], ...., [item,quantity]]
    @items = @user.cart_items.map do |cart|
      product = Product.find(cart.product_id)
      quantity = cart.quantity
      product_cat = product.category.name
      [product, quantity, product_cat]
    end
  end
  erb :cart
end

post '/cart/delete/:userid/:pid' do
  Cart.find_by(user_id: params['userid'], product_id: params['pid']).destroy
  redirect '/cart'
end
