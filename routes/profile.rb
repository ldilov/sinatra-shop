before '/profile*' do
  redirect '/login' unless session[:logged_in]
end

get '/profile' do
  # current user
  @user = User.find(session[:userid])

  # array of orders for current user
  @orders = Order.where(user_id: @user.id)

  erb :profile
end
