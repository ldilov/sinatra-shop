get '/profile/cart' do
  @user = User.find(session[:userid])

  unless @user.cart_items.empty?
    # @items is [[item, quantity], ...., [item,quantity]]
    @items = @user.cart_items.map do |cart|
      product = Product.find(cart.product_id)
      quantity = cart.quantity
      [product, quantity]
    end
  end
  erb :cart
end

post '/profile/cart/delete/:userid/:pid' do
  Cart.find_by(user_id: params['userid'], product_id: params['pid']).destroy
  redirect '/profile/cart'
end

post '/profile/cart/add/:itemid/:userid' do
  cart = Cart.new
  cart.product_id = params['itemid']
  cart.user_id    = params['userid']
  cart.quantity   = params['quantity']
  category_id     = Product.find(params['itemid']).category.id
  if cart.save
    flash[:add_success] = 'Продуктът е добавен в кошницата!'
  end

  redirect "/shop/#{category_id}/#{params['itemid']}/details"
end
