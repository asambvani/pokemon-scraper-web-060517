require 'pry'
require 'SQLite3'

class Pokemon

  attr_accessor :id, :name, :type, :hp
  attr_reader :db

  def initialize(name)
    @name = name
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp =? WHERE id =?", hp, self.id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?,?,?);", name, type, 60)
  end

  def self.find(id, db)

    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = self.new(array[1])
    pokemon.id = id
    pokemon.type = array[2]
    pokemon.hp = array[3]
    pokemon

  end

end
