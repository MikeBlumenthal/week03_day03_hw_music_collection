require ('pg')
require_relative('../db/sql_runner')
require_relative ('album')

class Artist

  attr_reader :id, :name

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
