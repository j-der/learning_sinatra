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

post '/songs' do
  @song = Songs.new(
    title: params[:title],
    artist: params[:artist],
    author: params[:author]
  )
  @song.save
  redirect '/songs'
end
