require( 'pg' )
require_relative( "./db/sql_runner")

class Artist

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    db = PG.connect({dbname:'music', host:'localhost'})
    sql =
      "
      INSERT INTO artists (name)
      VALUES
      ('#{@name}')
      RETURNING *;
      "
      @id = db.exec(sql)[0]['id'].to_i
      db.close()
  end

  def self.all()
    db = PG.connect({dbname:'music', host: 'localhost'})
    sql = "SELECT * FROM artists;"
    artists = db.exec(sql)
    db.close()
    return artists.map { |singer| Artist.new(singer) }
  end

  def artist_albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{ @id };"
    albums = SqlRunner.run( sql )
    return albums.map { |record| Albums.new(record) }

  end

end