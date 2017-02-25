require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artists' do
  @artist = Artist.all
  erb ( :"artists/index")
end


get '/artists/new' do
  erb(:"artists/new")
end

get '/artists/:id' do
  @artist = Artist.find_artist_by_id(params[:id])
  erb(:"artists/show")
end