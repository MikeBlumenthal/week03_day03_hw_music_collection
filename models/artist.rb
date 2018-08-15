require ('pg')
require_relative('../db/sql_runner')
require_relative ('album')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run( sql, values )
    @id = result[0]['id'].to_i
  end

  def all_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values )
    return result.map { |album| Album.new(album) }
  end

  def edit()
    sql = "UPDATE artists SET name = $1 WHERE id = $2 "
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run( sql )
    return artists.map { |artist| Artist.new(artist) }
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

end
