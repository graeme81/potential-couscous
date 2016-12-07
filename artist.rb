require( 'pg' )

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

end