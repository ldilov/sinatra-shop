get '/profile/orders' do
  @orders = Order.where(user_id: session[:userid])
  @user   = User.find(session[:userid])
  @orders.map! do |order|
    order.product_id = Product.find(order.product_id).title
  end
  erb :profile_orders
end
