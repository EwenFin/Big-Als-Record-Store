require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/genre.rb')
require_relative( '../models/album.rb')

get '/genres' do
  @genres = Genre.all
  erb(:"genres/index")
end

get '/genres/new' do
  erb(:"genres/new")
end

get '/genres/:id' do
  @genre = Genre.find_genre_by_id(params[:id])
  @albums = Album.all
  erb(:"genres/show")
end

post '/genres' do
  @genre = Genre.new(params)
  @genre.save
  redirect to '/genres'
end

get '/genres/:id/edit' do
  @genre = Genre.find_genre_by_id(params[:id])
  erb(:"genres/edit")
end

post '/genres/:id' do
  genre = Genre.new(params)
  genre.update
  redirect to "/genres/#{genre.id}"
end

post '/genres/:id/delete' do
  @genre = Genre.find_genre_by_id(params[:id])
  @genre.delete
  redirect to '/genres'
end