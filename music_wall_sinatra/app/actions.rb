# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  'List of Sweet Beats'
end
