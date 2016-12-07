require('pry')
require_relative('artist')

artist1= Artist.new( {"name" => "Thirsty Merc"})

artist1.save()  

binding.pry
nil