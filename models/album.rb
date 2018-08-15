require ('pg')

class Album

  attr_reader :id, :title, :genre, :artist_id

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @genre = info['genre']
    @artist_id = info['artist_id'].to_i
  end

end
