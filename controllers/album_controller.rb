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

post '/albums' do
  @album = Album.new(params)
  @album.save 
  redirect to '/albums'
end

get '/albums/:id/edit' do
  @album = Album.find_album_by_id(params[:id])
  erb(:"albums/edit")
end

post '/albums/:id/delete' do
  @album = Album.find_album_by_id(params[:id])
  @album.delete
  redirect to '/albums'
end