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
