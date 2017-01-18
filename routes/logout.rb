get '/logout' do
  session.map { |param, value| session[param] = nil}
  flash[:error] = nil
  flash[:success] = nil
  redirect '/'
end
