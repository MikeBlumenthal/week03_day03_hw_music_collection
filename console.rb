require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all
Artist.delete_all


  artist1 = Artist.new({
    'name' => 'Radiohead'
    })

  artist1.save

  album1 = Album.new({
    'title' => 'OK Computer',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })

  album2 = Album.new({
    'title' => 'The Bends',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })

  album1.save
  album2.save


binding.pry
nil
