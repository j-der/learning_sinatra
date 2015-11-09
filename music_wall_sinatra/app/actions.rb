# Homepage (Root path)

get '/' do
  erb :index
end

get '/songs' do
  @songs = Songs.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end
get '/songs/:id' do
  @song = Songs.find params[:id]
  erb :'songs/show'
end
post '/songs' do
  @song = Songs.new(
    title: params[:title],
    artist: params[:artist],
    author: params[:author]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end

end
