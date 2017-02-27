require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb')
require_relative( '../models/genre.rb')

get '/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all
  @genres = Genre.all
  erb(:"albums/new")
end

get '/albums/genre' do
  @albums = Album.all
  erb(:"albums/genre")
end

get '/albums/:id' do
  @album = Album.find_album_by_id(params[:id])
  erb(:"albums/show")
end

post '/albums' do
  @artist = Artist.all
  @album = Album.new(params)
  @album.save 
  redirect to '/albums'
end

get '/albums/:id/edit' do
  @album = Album.find_album_by_id(params[:id])
  erb(:"albums/edit")
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{album.id}"
end

post '/albums/:id/delete' do
  @album = Album.find_album_by_id(params[:id])
  @album.delete
  redirect to '/albums'
end