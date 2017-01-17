get '/' do
  if session[:logged_in].nil?
    redirect '/login'
  end

  erb :index
end
