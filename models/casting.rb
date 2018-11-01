class Casting

  attr_reader :id, :star_id, :movie_id
  attr_accessor :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @fee = options['fee'].to_i
    @star_id = options['star_id'].to_i
    @movie_id = options['movie_id'].to_i
  end

  def save()
    sql = "INSERT INTO castings (fee, star_id, movie_id) VALUES ($1, $2, $3)
RETURNING id;"
    values = [@fee, @star_id, @movie_id]
    id = SqlRunner.run(sql, values).first
    @id = id['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings_hash = SqlRunner.run(sql)
    castings = castings_hash.map { |casting| Movie.new(casting)}
    return castings  
  end

end
