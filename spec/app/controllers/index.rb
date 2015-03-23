get '/' do
  @all_notes = []
  @all_notes = Note.all
  erb :index
end

post '/' do
  Note.create(
    title: params[:title],
    content: params[:content]
    )
  redirect '/'
end

get '/note/:note_title' do
  @note_title = params[:note_title]
  @this_note = Note.where(title: @note_title).first
  erb :note
end

get '/edit/:note_title' do
  @note_title = params[:note_title]
  @this_note = Note.where(title: @note_title).first

erb :edit
end

put '/note/:note_title' do
  this_note = Note.where(title: params[:note_title]).first
  this_note.title = params[:title]
  this_note.content = params[:content]
  this_note.save

  redirect '/note/' + params[:title]
end

delete '/note/:note_title' do
  this_note = Note.where(title: params[:note_title]).first
  this_note.destroy

  redirect '/'
end



# get '/article_list/:category_id' do
#   @article_list = []
#   this_category_id = params[:category_id]

#   @category_name = Category.where(id: this_category_id).first

#   article = Article.all.where(category_id: this_category_id)
#   article.each do |art|
#     @article_list << art.title
#   end

#   erb :"categories/article_list"
# end

# post '/article_list/:category_id' do
#   a = Article.new
#   a.title = params[:title]
#   # t.decimal :price
#   # t.string  :email
#   a.description = params[:description]
#   p "*" * 80
#   p params[:category_id]
#   a.category_id = params[:category_id]
#   a.created_at = Time.now
#   a.updated_at = Time.now
#   a.save

#   redirect '/article_list/:category_id'
# end


# Word.all.where({word: @word}).first

# replace note_titel with IDs (less brittle), make routes RESTful
