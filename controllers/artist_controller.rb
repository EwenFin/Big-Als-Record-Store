require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative( '../models/album.rb')

get '/artists' do
  @artist = Artist.all
  erb (:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

get '/artists/:id' do
  @artist = Artist.find_artist_by_id(params[:id])
  erb(:"artists/show")
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  redirect to '/artists'
end

get '/artists/:id/edit' do
  @artist = Artist.find_artist_by_id(params[:id])
  erb(:"artists/edit")
end

get '/artists/:id/albums' do
  @artist = Artist.find_artist_by_id(params[:id])
  @albums = Album.all
  erb (:"artists/albums")
end

post '/artists/:id' do 
  artist = Artist.new(params)
  artist.update
  redirect to "/artists/#{artist.id}"
end
#Why do artists need an update method?  Ask Prince again

post '/artists/:id/delete' do
  @artist = Artist.find_artist_by_id(params[:id])
  @artist.delete
  redirect to '/artists'
  end