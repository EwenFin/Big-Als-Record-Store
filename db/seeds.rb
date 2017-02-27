require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/genre.rb')
require( 'pry' )

Artist.delete_all
Genre.delete_all
Album.delete_all

artist1 = Artist.new({'name' => 'Miles Davis'})
artist1.save
artist2 = Artist.new({'name' => 'Michael Jackson'})
artist2.save
artist3 = Artist.new({'name' => 'Metallica'})
artist3.save

rock = Genre.new({'genre' => 'Rock'})
rock.save
jazz = Genre.new({'genre' => 'Jazz'}) 
jazz.save
pop = Genre.new({'genre' => 'Pop'})
pop.save
metal = Genre.new({'genre' => 'Metal'})
metal.save


album1 = Album.new({
  'title' => 'Blue in Green',
  'genre_id' => jazz.id,
  'quantity' => 5,
  'retail' => 9.99,
  'wholesale' => 5.34,
  'artist_id' => artist1.id,
  })

album2 = Album.new({
  'title' => 'Thriller',
  'genre_id' => pop.id,
  'quantity' => 9,
  'retail' => 7.99,
  'wholesale' => 5.04,
  'artist_id' => artist2.id,
  })

album3 = Album.new({
  'title' => 'Bad',
  'genre_id' => pop.id,
  'quantity' => 1,
  'retail' => 6.99,
  'wholesale' => 4.94,
  'artist_id' => artist2.id,
  })

album4 = Album.new({
  'title' => 'Metallica',
  'genre_id' => metal.id,
  'quantity' => 3,
  'retail' => 6.99,
  'wholesale' => 4.04,
  'artist_id' => artist3.id,
  })


album1.save
album2.save
album3.save
album4.save

binding.pry
nil
