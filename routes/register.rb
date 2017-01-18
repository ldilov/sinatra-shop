get '/register' do
  redirect '/' if session[:logged_in] == true

  erb :register
end

post '/register' do
  user = User.new
  user.attributes.each do |attribute, value|
    param = params[attribute.to_sym]
    user[attribute.to_sym] = param unless param.nil?
  end
  user.level = 1
  user.password_confirmation = params[:password_confirmation]
  if user.save
    session[:logged_in] = true
    session[:username]  = user.username
    session[:email]     = user.email
    flash[:success]     = "Успешно се регистрирахте!"
    redirect '/'
  else
    flash[:error]       = "Възникна грешка. Проверете въведените данни отново!"
  end
  redirect '/register'
end
