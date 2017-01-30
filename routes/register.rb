get '/register' do
  redirect '/' if session[:logged_in] == true

  erb :register
end

post '/register' do
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
    session[:logged_in] = true
    session[:username]  = user.username
    session[:email]     = user.email
    session[:level]     = user.level
    session[:rank]      = user.rank
    session[:userid]    = user.id
    flash[:success]     = 'Успешно се регистрирахте!'
    redirect '/'
  else
    flash[:error]       = 'Възникна грешка. Проверете въведените данни отново!'
  end
  redirect '/register'
end
