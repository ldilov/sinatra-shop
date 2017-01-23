get '/shop' do
  session[:filtered_ids] = nil
  @categories = Category.all.to_a
  erb :shop
end

get '/shop/:cat/:page' do
  # 6 products per page
  @category = Category.where(id: params['cat']).to_a.first
  @page = params['page'].to_i
  if session[:filtered_ids]
    @pages = session[:filtered_ids].count / 6 + 1
    @items = Product.find(session[:filtered_ids])[((@page - 1) * 6)...(@page * 6)]
  else
    @pages = @category.get_items.count / 6 + 1
    @items = @category.get_items[((@page - 1) * 6)...(@page * 6)]
  end
  flash[:error] = "Няма налични продукти." if @items.count.zero?
  erb :list
end

post '/shop/:cat/:page' do
  @category = Category.where(id: params['cat']).to_a.first.id
  @page = params['page'].to_i
  @items = @category.get_items
  @params = params
  params.each do |param, value|
    case param
    when 'ram'
      @items = @items.select{ |item| item.ram == value.to_i }
    when 'cpu_brand'
      @items = @items.select{ |item| item.cpu_name == value.to_s }
    when 'gpu_brand'
      @items = @items.select{ |item| item.gpu_brand == value.to_s }
    when 'gpu_memory'
      @items = @items.select{ |item| item.gpu_vram == value.to_i }
    when 'storage_type'
      @items = @items.select{ |item| item.storage_ssd == value.to_i }
    when 'storage_size'
      @items = @items.select{ |item| item.storage_size == value.to_i}
    when 'minprice'
      @items = @items.select{ |item| item.price > value.to_f }
    when 'maxprice'
      @items = @items.select{ |item| item.price < value.to_f }
    end
  end
  filtered_items = @items
  @items = filtered_items[((@page - 1) * 6)...(@page * 6)]
  @pages = filtered_items.count / 6 + 1
  session[:filtered_ids] = filtered_items.map { |item| item.id }
  flash[:error] = "Няма налични продукти." if @items.count.zero?
  erb :list
end
