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

get '/notes/:id' do
  @this_note = Note.find_by(id: params[:id])
  erb :note
end

get '/notes/:id/edit' do
  @this_note = Note.find_by(id: params[:id])

erb :edit
end

put '/notes/:id' do
  this_note = Note.where(id: params[:id]).first
  this_note.title = params[:title]
  this_note.content = params[:content]
  this_note.save

  redirect '/notes/' + params[:id]
end

delete '/notes/:id' do
  this_note = Note.find_by(id: params[:id])
  this_note.destroy

  redirect '/'
end


