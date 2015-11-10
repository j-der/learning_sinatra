# Homepage (Root path)
helpers do
  def current_user
    User.find(session[:user]) if session[:user]
  end
end

get '/' do
  erb :'index'
  # @user = User.new
  # redirect '/index'
end

get '/sign_up' do
  @user = User.new
  erb :'sign_up'

end

get 'index' do
  erb :'index'
end

get '/songs' do
  @songs = Songs.all
  erb :'songs/all_songs'
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

# Look into REST for doing voting etc
# activerecrod passwords
post '/index' do
  if @user = User.find_by(username: params[:username])
    # logged_in = user.authenticate(params[:password]) this is used when you use the password digest thing
      # if logged_in
      # session[:user] = @user.id
    # else
    #   error message
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect '/songs/all_songs'
    end
  else
    @error = "Nuh-uh-uh, you didn't say the magic word!"
    redirect '/songs/all_songs'
  end

end

post '/sign_up' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    )
  if @user.save
    session[:id] = @user.id
    redirect '/index'
  else
    redirect '/songs'
  end
end
