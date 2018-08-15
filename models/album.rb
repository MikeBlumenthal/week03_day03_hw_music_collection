require ('pg')
require_relative ('artist')

class Album

  attr_reader :id, :title, :genre, :artist_id

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

end
