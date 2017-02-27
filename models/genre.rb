require_relative ('../db/sql_runner.rb')

class Genre
  attr_reader :id
  attr_accessor :genre
  def initialize( options )
    @id = options['id'].to_i
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO genres(genre) VALUES ('#{@genre}') RETURNING *"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM genres;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run(sql)
    return genres.map{|genre| Genre.new(genre)}
  end

  def albums_by_genre
    sql = "SELECT * FROM albums WHERE genre_id = #{@id}"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def update
    sql = "UPDATE genres SET (genre) = ('#{@genre}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def find_album_by_genre(genre_id)
    sql ="SELECT * FROM albums WHERE id = #{genre_id}"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end
end