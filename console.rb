require_relative('db/sql_runner')
require_relative('./models/movie')
require_relative('./models/star')
require_relative('./models/casting')
require('pry-byebug')

batman = Movie.new({'title' => 'batman begins', 'genre' => 'rap', 'budget' => 1000 })
batman.save
bale = Star.new({'first_name' => 'Christian', 'last_name' => 'Bale'})
caine = Star.new({'first_name' => 'Michael', 'last_name' => 'Caine'})
bale.save
casting_hash = {'fee' => 400, 'movie_id' => batman.id, 'star_id' => bale.id }
casting_hash2 = {'fee' => 400, 'movie_id' => batman.id, 'star_id' => caine.id }
casting1 = Casting.new(casting_hash)
casting2 = Casting.new(casting_hash2)


casting1.save
batman.remaining_budget
binding.pry

nil
