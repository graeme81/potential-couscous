require('pry')
require_relative('artist')
require_relative('album')

artist1 = Artist.new( {"name" => "Thirsty Merc"} )
artist1.save()  

album1 = Album.new( {"album_name" => "Best of TM"} ) 
album1.save()

binding.pry
nil