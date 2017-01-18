get '/logout' do
  session[:logged_in] = nil
  flash[:error] = nil
  flash[:success] = nil
  redirect '/'
end
