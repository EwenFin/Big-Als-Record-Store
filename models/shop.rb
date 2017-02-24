require_relative ('../db/sql_runner.rb')

class Shop
  attr_reader :till
  attr_accessor :stock_array
  
  def initialize(till, stock_array)
    #Are these accessors redundant?  
    @till = 0
    @stock_array = []
  end

  def add_to_stock(album)
    @stock_array << album
  end

  def remove_from_stock(album)
    @stock_array.delete(album)
  end

  def sale(album)
    price = album.retail
    @till += price
    @stock_array.delete(album)
  end

end