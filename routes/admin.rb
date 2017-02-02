before '/admin*' do
  redirect '/login' unless session[:logged_in]
  403 unless session[:level] > 1
end

get '/admin' do
  erb :admin, :layout => :adminlayout
end

get '/admin/users/:p' do
  @page  = params['p'].to_i
  @users = User.all[(@page - 1) * 20...@page * 20]
  @pages = (User.all.count / 20.to_f).ceil
  erb :admin_users, :layout => :adminlayout
end

get '/admin/users/edit/:id' do
  @user = User.find(params['id'])
  erb :admin_users_edit, :layout => :adminlayout
end

get '/admin/users/delete/:id' do
  User.find(params['id']).destroy
  flash['success'] = 'Операцията е успешна!'
  redirect '/admin/users/1'
end

post '/admin/users/edit/:id' do
  user = User.find(params['id'])
  (user.attributes.keys & params.keys).each do |key|
    user.update_column(key.to_s, params[key.to_s]) unless params[key].nil? || params[key].empty?
  end

  flash[:success] = 'Промените са приложени успешно!'

  redirect "/admin/users/edit/#{params['id']}"
end

get '/admin/users/add/' do
  erb :admin_users_add, :layout => :adminlayout
end

post '/admin/users/add' do
  user = User.new
  user.attributes.keys.each do |attribute|
    param = params[attribute.to_sym]
    user[attribute.to_sym] = param unless param.nil?
  end
  user.level = 1
  user.password_confirmation = params[:password_confirmation]
  unless user.valid?
    user.errors.messages.each do |param, msg|
      flash[param] = "#{param.to_s} #{msg.last.nil? ? msg.first : msg.last}"
    end
  end

  if user.save
    flash[:success]     = 'Успешно се регистрирахте!'
  else
    flash[:error]       = 'Възникна грешка. Проверете въведените данни отново!'
  end
  redirect '/admin/users/1'
end

get '/admin/products/:p' do
  @page  = params['p'].to_i
  @products = Product.all[(@page - 1) * 20...@page * 20]
  @pages = (Product.all.count / 20.to_f).ceil
  erb :admin_products, :layout => :adminlayout
end

get '/admin/products/edit/:id' do
  @product = Product.find(params['id'])
  @categories = Category.all
  erb :admin_products_edit, :layout => :adminlayout
end

get '/admin/products/delete/:id' do
  Product.find(params['id']).destroy
  flash['success'] = 'Операцията е успешна!'
  redirect '/admin/products/1'
end

post '/admin/products/edit/:id' do
  product = Product.find(params['id'])
  (product.attributes.keys & params.keys).each do |key|
    product.update_column(key.to_s, params[key.to_s]) unless params[key].nil? || params[key].empty?
  end

  flash[:success] = 'Промените са приложени успешно!'

  redirect "/admin/products/edit/#{params['id']}"
end

get '/admin/products/add/' do
  @categories = Category.all
  erb :admin_products_add, :layout => :adminlayout
end

post '/admin/products/add/' do
  product = Product.new
  (params.keys & product.attributes.keys).each do |attrib|
    product.send("#{attrib}=".to_s, params[attrib])
  end
  if product.save
    flash[:success] = 'Успешно е добавен продукт!'
  else
    flash[:error]   = 'Възникна грешка при добавянето на продукта!'
  end

  redirect '/admin/products/1'
end

get '/admin/orders/:p' do
  @page  = params['p'].to_i
  @orders = Order.all[(@page - 1) * 20...@page * 20]
  @pages = (Order.all.count / 20.to_f).ceil
  @orders.map! do |order|
    [order, User.find(order.user_id).phone]
  end
  erb :admin_orders, :layout => :adminlayout
end

post '/admin/orders/finish/:id' do
  order = Order.find(params['id'])
  order.is_completed = true
  if order.save
    flash[:success] = 'Поръчката е завършена!'
  end

  redirect '/admin/orders/1'
end

post '/admin/orders/delete/:id' do
  Order.find(params['id']).destroy
  flash[:success] = "Поръчка №#{params['id']} е изтрита успешно!"
  redirect '/admin/orders/1'
end
