before '/orders*' do
  redirect '/login' unless session[:logged_in]
end

post '/orders/add' do
  cart_items = Cart.get_items(session[:userid])
  @order = Order.new
  @order.user_id = session[:userid]
  @order.price = 0
  @order.save
  # add record to order_items for all items in the cart
  cart_items.each do |item|
    order_items = OrderItem.new
    order_items.product_id = item.product_id
    order_items.order_id = @order.id
    order_items.quantity = params['quantity']
    order_items.save
  end
  # calculating new order price
  @order.order_items.map do |item|
    @order.price += Product.find(item.product_id).price * item.quantity
  end
  @order.save
  # Time to empty the user cart
  User.find(session[:userid]).empty_cart

  erb :orders_add
end

post '/orders/add/final' do
  @order = Order.find(params['order'])
  @order.first_name = params['fname']
  @order.last_name  = params['lname']
  @order.delivery_address = params['address']
  @order.is_completed = false
  if @order.save
    order_items = @order.order_items
    @items = order_items.map do |item|
      product = Product.find(item.product_id)
      product.quantity -= item.quantity
      product.save
      quantity = item.quantity
      [product, quantity]
    end
      flash[:success] = 'Поръчката е завършена!'
  else
    flash[:error]   = 'Поръчката е неуспешна!'
    @order.destroy
  end
  erb :orders_invoice
  # redirect '/orders/invoice'
end

get '/orders/invoice' do
  erb :orders_invoice
end
