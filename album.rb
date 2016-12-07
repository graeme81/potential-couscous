require( 'pg' )

class Album

  attr_reader :id, :album_name, :artist_id

  def initialize( options )
    @id = options['id']
    @album_name = options['album_name']
    #@artist_id = options['artist_id'].to_i
  end

  def save()
    db = PG.connect({dbname:'music', host:'localhost'})
    sql =
      "
      INSERT INTO albums (album_name)
      VALUES
      ('#{@album_name}')
      RETURNING *;
      "
      @id = db.exec(sql)[0]['id'].to_i
      db.close()
  end

end