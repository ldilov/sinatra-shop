get '/' do
  redirect '/login' if session[:logged_in].nil?

  erb :index
end
