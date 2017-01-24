get '/login' do
  redirect '/' if session[:logged_in]

  @page = 'Вход в системата'
  erb :login
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user.nil?
    flash[:error] = 'Грешно име или парола!'
  else
    flash[:success]     = 'Вие се вписахте успешно!'
    session[:logged_in] = true
    session[:username]  = params[:username]
    session[:email]     = params[:email]
    session[:level]     = user.level
    session[:rank]      = user.rank
  end

  redirect '/'
end
