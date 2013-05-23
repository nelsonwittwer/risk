require_relative "lib/movie"
require_relative "lib/api"
@movies = []

def find_movie
  puts "Add a movie you really like."
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie!= "fail."
    puts "Found: #{movie.title}. Score: #{movie.score}"
    @movies << movie.score
  else
    puts "I failed to find the movie you asked for. Care to try again?"
    find_movie
  end
end

find_movie

while true do
  puts "The average movie rating for the movies you like is: " 
  movies_average_rating = []
  movies_average_year = []
  @movies.each |m|
    movies_average_rating << m.score
    movies_average_year << m.year
  end
  puts movies_average_rating.inject{ |sum, el| sum + el }.to_f / movies_average_rating.size
  puts movies_average_year.inject{ |sum, el| sum + el }.to_f / movies_average_year.size


  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end

#how does one best test something like this that is not an object? Do I describe movie_json do?
#I didn't know the best approach here, so I didn't test this. Forgive me for my sins.