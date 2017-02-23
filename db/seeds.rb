require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/shop.rb' )
require( 'pry' )

Artist.delete_all
Album.delete_all


artist1 = Artist.new({'name' => 'Miles Davis'})
artist1.save
artist2 = Artist.new({'name' => 'Michael Jackson'})
artist2.save
artist3 = Artist.new({'name' => 'Metallica'})
artist3.save
 
album1 = Album.new({
  'title' => 'Blue in Green',
  'genre' => 'Jazz',
  'quantity' => 5,
  'retail' => 9.99,
  'wholesale' => 5.34,
  'artist_id' => artist1.id,
  })
album2 = Album.new({
  'title' => 'Thriller',
  'genre' => 'Pop',
  'quantity' => 9,
  'retail' => 7.99,
  'wholesale' => 5.04,
  'artist_id' => artist2.id,
  })
album3 = Album.new({
  'title' => 'Bad',
  'genre' => 'Pop',
  'quantity' => 1,
  'retail' => 6.99,
  'wholesale' => 4.94,
  'artist_id' => artist2.id,
  })
album4 = Album.new({
  'title' => 'Metallica',
  'genre' => 'Metal',
  'quantity' => 3,
  'retail' => 6.99,
  'wholesale' => 4.94,
  'artist_id' => artist3.id,
  })


album1.save
album2.save
album3.save
album4.save

binding.pry
nil
