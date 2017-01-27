get '/profile/edit' do
  erb :profile_edit
end

post '/profile/edit' do
  user = User.find(session[:userid])
  (user.attributes.keys & params.keys).each do |key|
    user.update_column(key.to_s, params[key.to_s]) unless params[key].nil?
  end
  user.password_confirmation = params['psw_confirm']
  flash[:success] = 'Промените са приложени успешно!'

  redirect '/profile/edit'
end
