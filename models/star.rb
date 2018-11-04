class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1, $2)
    RETURNING id;"
    values = [@first_name, @last_name]
    id = SqlRunner.run(sql, values).first
    @id = id['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stars"
    stars_hash = SqlRunner.run(sql)
    star = stars_hash.map { |stars| Movie.new(stars)}
    return star
  end

  def movies()
    sql = "SELECT movies.* FROM movies
    INNER JOIN castings
    ON movie_id = movies.id
    WHERE star_id = $1"
    values = [@id]
    movies_hash = SqlRunner.run(sql, values)
    return movies_hash.map { |movie| Movie.new(movie)}
  end



end
