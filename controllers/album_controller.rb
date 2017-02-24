require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get '/albums/new' do
  erb(:"albums/new")
end

get '/albums/:id' do
  @album = Album.find_album_by_id(params[:id])
  erb(:"albums/show")
end