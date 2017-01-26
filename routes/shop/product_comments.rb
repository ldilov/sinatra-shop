get '/comment/edit/:id/:catid/:itemid' do
  user = User.find(session[:userid])
  @comment = user.comments.find(params['id'])
  halt 404 if @comment.nil?
  @url = "/shop/#{params['catid']}/#{params['itemid']}/details"
  erb :comment_edit
end

get '/comment/del/:id/:catid/:itemid' do
  user = User.find(session[:userid])
  user.comments.find(params['id']).destroy
  flash[:edit_success] = 'Коментарът е изтрит успешно!'
  redirect "/shop/#{params['catid']}/#{params['itemid']}/details"
end

post '/comment/edit/:id' do
  user = User.find(session[:userid])
  @comment = user.comments.find(params['id'])
  @comment.description = params['description']
  if @comment.save
    flash[:edit_success] = 'Редакцията е успешна!'
  end
  redirect params['url']
end

post '/comment/add' do
  comment = Comment.new
  comment.user_id = session[:userid]
  comment.product_id = params['itemid']
  comment.description = params['content']
  # verfication
  error_msg = 'Верификацията е неуспешна: ' + params['verify']
  if params['verify'].to_i == 681
    if comment.save
      flash[:add_success] = 'Коментарът е успешно добавен!'
    else
      flash[:add_error] = "Грешка: #{comment.errors.full_messages.to_sentence}"
    end
  else
    halt(error_msg)
  end

  redirect params['url']
end
