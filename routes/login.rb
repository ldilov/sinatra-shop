get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user.nil?
    flash[:error] = 'Грешно име или парола!'
  else
    flash[:success] = "Вие се вписахте успешно!"
    session[:logged_in] = true
  end

  redirect '/'
end
