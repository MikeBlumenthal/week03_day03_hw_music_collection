require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')


  artist1 = Artist.new({
    'name' => 'Radiohead'
    })

  artist1.save



binding.pry
nil
