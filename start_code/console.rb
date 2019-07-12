require_relative("./models/movie")
require_relative("./models/star")
require_relative("./models/casting")
require "pry"

Movie.delete_all
# Casting.delete_all


movie1 = Movie.new({'title' => 'Star wars', 'genre' => 'sci-fi'})
movie2 = Movie.new({'title' => 'matrix', 'genre' => 'actions'})
star1 = Star.new({'first_name' => 'paul', 'last_name' => 'underwood'})
star2 = Star.new({'first_name' => 'mark', 'last_name' => 'goldberg'})



movie1.save
movie2.save
star1.save
star2.save


casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 50})

casting1.save

# casting1.delete()


# movie1.title = "tmnt"
# movie1.update()


Movie.all

binding.pry
nil
