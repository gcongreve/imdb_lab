require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @budget]
    id = SqlRunner.run(sql, values).first
    @id = id['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies_hash = SqlRunner.run(sql)
    movies = movies_hash.map { |movie| Movie.new(movie)}
    return movies
  end

  def stars()
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings
    ON star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    stars_hash = SqlRunner.run(sql, values)
    return stars_hash.map { |star| Star.new(star)}
  end

  def remaining_budget()
    sql = ""
    values = [@id]

  end

end
