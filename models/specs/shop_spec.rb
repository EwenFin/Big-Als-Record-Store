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

    @shop1 = Shop.new(0,[])
  end

  def test_shop_has_stock
    @shop1.add_to_stock(@album1)
    @shop1.add_to_stock(@album2)
    assert_equal([@album1, @album2], @shop1.stock_array)
  end

  def test_shop_can_remove_stock
    @shop1.add_to_stock(@album1)
    @shop1.add_to_stock(@album2)
    assert_equal([@album1, @album2], @shop1.stock_array)
    @shop1.remove_all_copies_from_stock(@album1)
    assert_equal([@album2], @shop1.stock_array)
  end

  # def test_sale
  #   @shop1.add_to_stock(@album1)
  #   @shop1.add_to_stock(@album2)
  #   @shop1.sale(@album1)
  #   assert_equal(9.99, @shop1.till)
  #   assert_equal([@album2], @shop1.stock_array)
  # end

  def test_individual_gross_profit
    assert_equal( "46.5%" ,@shop1.individual_gross_profit(@album1))
  end




  
end