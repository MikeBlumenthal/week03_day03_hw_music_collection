require ('pg')
require_relative('../db/sql_runner')
require_relative ('artist')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @genre = info['genre']
    @artist_id = info['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run( sql, values )
    @id = result[0]['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values =[@artist_id]
    result = SqlRunner.run( sql, values )
    artist_info = result[0]
    return Artist.new(artist_info)
  end

  def edit()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4 "
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new(album) }
  end

  def Album.find_by_genre(genre)
    sql = "SELECT * FROM albums WHERE genre = $1"
    values = [genre]
    result = SqlRunner.run( sql, values )
    return result.map { |album| Album.new(album) }
  end

  def Album.find_by_id(id)
    sql = "SELECT * FROM albums where id = $1"
    values = [id]
    result = SqlRunner.run( sql, values )
    return result[0]
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

end
