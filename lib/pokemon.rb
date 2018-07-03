class Pokemon

attr_accessor :name, :type, :id, :db, :hp

def initialize(id:, name:, type:, db:)
  @name = name
  @type = type
  @id = id
  @db = db
end

def self.save(name, type, db)
  sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

  db.execute(sql, name, type)
end

def self.find(id, db)
  sql = "SELECT * FROM pokemon WHERE id = ?"
  pokemon_array = db.execute(sql, id)
  poke = pokemon_array.flatten
  Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
end


def alter_hp(int, db)
  sql = "UPDATE pokemon SET hp = ? WHERE name = ?"
  self.hp = int
  db.execute(sql, int, self.name)
end


end
