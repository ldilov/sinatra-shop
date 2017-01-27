get '/profile/comments' do
  @comments = User.find(session[:userid]).comments
  erb :profile_comments
end
