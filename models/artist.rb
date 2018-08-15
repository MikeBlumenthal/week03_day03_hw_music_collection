require ('pg')

class Artist

  attr_reader :id, :name

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end





end
