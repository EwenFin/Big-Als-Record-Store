require('minitest/autorun')
require('minitest/rg')
require_relative('../shop.rb')
require_relative('../album.rb')
require_relative('../artist.rb')

class TestShop < MiniTest::Test
  def setup
    @artist1 = Artist.new({'name' => 'Miles Davis'})
  
    @artist2 = Artist.new({'name' => 'Michael Jackson'})
    
    @album1 = Album.new({
      'title' => 'Blue in Green',
      'genre' => 'Jazz',
      'quantity' => 5,
      'retail' => 9.99,
      'wholesale' => 5.34,
      'artist_id' => @artist1.id,
      })

    @album2 = Album.new({
      'title' => 'Thriller',
      'genre' => 'Pop',
      'quantity' => 9,
      'retail' => 7.99,
      'wholesale' => 5.04,
      'artist_id' => @artist2.id,
      })

    @shop1 = Shop.new(0)
  end  
end