get '/cart' do
  404 if session[:logged_in]
  @user = User.find(session[:userid])

  unless @user.cart_items.empty?
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

post '/cart/add/:itemid/:userid' do
  cart = Cart.new
  cart.product_id = params['itemid']
  cart.user_id    = params['userid']
  cart.quantity   = params['quantity']
  category_id     = Product.find(params['itemid']).category.id
  if cart.save
    flash[:success] = 'Продуктът е добавен в кошницата!'
  end

  redirect "/shop/#{category_id}/1/details"
end
