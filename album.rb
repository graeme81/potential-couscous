require( 'pg' )
require_relative('./artist')
require_relative( "./db/sql_runner")

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize( options )
    @id = options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def artist()

    sql = "SELECT * FROM albums WHERE id =#{@artist_id};"
    customer = SqlRunner.run( sql )[0]
    return Artist.new( customer )

  end

  def save()
    db = PG.connect({dbname:'music', host:'localhost'})
    sql =
      "
      INSERT INTO albums (title, genre, artist_id)
      VALUES
      ('#{@title}', '#{genre}', '#{artist_id}')
      RETURNING *;
      "
    @id = db.exec(sql)[0]['id'].to_i
    db.close()
  end

  def self.all()
    db = PG.connect({dbname:'music', host: 'localhost'})
    sql = "SELECT * FROM albums;"
    album = db.exec(sql)
    db.close()
    return album.map { |record| Album.new(record) }
  end


end