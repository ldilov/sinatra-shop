get '/logout' do
  session[:logged_in].map { |param, value| session[param] = nil}
  flash[:error] = nil
  flash[:success] = nil
  redirect '/'
end
