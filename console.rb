require_relative('db/sql_runner')
require_relative('./models/movie')
require_relative('./models/star')
require_relative('./models/casting')
require('pry-byebug')

batman = Movie.new({'title' => 'batman begins', 'genre' => 'rap'})
batman.save
bale = Star.new({'first_name' => 'Christian', 'last_name' => 'Bale'})
bale.save
casting_hash = {'fee' => 400, 'movie_id' => batman.id, 'star_id' => bale.id }
casting1 = Casting.new(casting_hash)


casting1.save

binding.pry
nil
