require_relative ('../db/sql_runner.rb')
require_relative ('../models/album.rb')

class Shop
  attr_reader :till
  
  
  def initialize(till)
    #Are these accessors redundant?  
    @till = 0
  end

  def sale(album_id)
    price = album.retail
    @till += price
    sql1 = "SELECT * FROM albums WHERE id = #{album_id}"
    albums = SqlRunner.run(sql1)
    album = Album.new(albums[0])
    album.quantity -= 1
    sql2 = "UPDATE albums SET (title, artist_id, genre_id, quantity, retail, wholesale) = ('#{album.title}', #{album.artist_id}, #{album.genre_id}, #{album.quantity}, '#{album.retail}','#{album.wholesale}') WHERE id = #{album_id};" 
    SqlRunner.run(sql2)
  end

end