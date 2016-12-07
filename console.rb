require('pry')
require_relative('artist')
require_relative('album')

artist1 = Artist.new( {"name" => "Thirsty Merc"} )
artist1.save()  

album1 = Album.new( {
  "title" => "Best of TM",
  "genre" => "Pop Rock",
  "artist_id" => artist1.id
  } ) 

album1.save()

binding.pry
nil