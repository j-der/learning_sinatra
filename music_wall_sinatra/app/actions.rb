# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Songs.all
  erb :'songs/index'
end
