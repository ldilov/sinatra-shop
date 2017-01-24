get '/logout' do
  session.keys.map { |param| session[param] = nil }
  flash[:error] = nil
  flash[:success] = nil
  redirect '/'
end
