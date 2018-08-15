require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')


  artist1 = Artist.new({
    'name' => 'Radiohead'
    })

  album1 = Album.new({
    'title' => 'OK Computer',
    'genre' => 'Rock',
    'artist_id' => 2
    })

  artist1.save
  album1.save


binding.pry
nil
