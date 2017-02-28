require_relative ('../db/sql_runner.rb')

class Album

  attr_reader(:id, :artist_id, :genre_id)
  attr_accessor(:title, :quantity, :retail, :wholesale)

  def initialize(options)
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre_id = options['genre_id'].to_i
    @quantity = options['quantity'].to_i
    @retail = options['retail']
    @wholesale = options['wholesale']
  end

  def save
    sql = "INSERT INTO albums (artist_id, title, genre_id, quantity, retail, wholesale) VALUES (#{@artist_id}, '#{@title}', #{@genre_id},#{@quantity}, '#{@retail}','#{@wholesale}' ) RETURNING *"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artists = SqlRunner.run(sql)
    return Artist.new(artists[0])
  end

  def update
    sql = "UPDATE albums SET (title, artist_id, genre_id, quantity, retail, wholesale) = ('#{@title}', #{@artist_id}, #{@genre_id}, #{@quantity}, '#{@retail}','#{@wholesale}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find_album_by_id(search_id)
    sql = "SELECT * FROM albums WHERE id = #{search_id}"
    albums = SqlRunner.run(sql)
    return Album.new(albums[0])
  end

  def genre
    sql = "SELECT * FROM genres INNER JOIN albums ON albums.genre_id = genres.id WHERE albums.id = #{@id}"
    genres = SqlRunner.run(sql)
    return Genre.new(genres[0])
  end
end 