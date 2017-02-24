require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artist' do
  @artist = Artisit.all
  erb ( :"artists/index")
end