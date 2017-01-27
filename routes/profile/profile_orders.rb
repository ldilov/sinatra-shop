get '/profile/orders' do
  @orders = Order.where(user_id: session[:userid]).to_a
  @user   = User.find(session[:userid])
  @orders = @orders.map! { |order| [order, order.order_items]}.to_h

  erb :profile_orders
end
