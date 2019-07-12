require_relative ("../db/sql_runner")
require_relative("./movie")
require_relative("./star")

class Casting

    attr_accessor :fee, :star_id, :movie_id
    attr_reader :id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @movie_id = options['movie_id']
      @star_id = options['star_id']
      @fee = options['fee']
    end

    def save()
      sql = "INSERT INTO castings(movie_id, star_id, fee) VALUES($1, $2, $3) RETURNING id"
      values = [@movie_id, @star_id, @fee]
      @id = SqlRunner.run(sql,values).first['id']
    end

    def update()
      sql = "UPDATE castings SET( movie_id, star_id, fee) = ($1, $2, $3) WHERE id = $4"
      values = [@movie_id, @star_id, @fee,@id]
      SqlRunner.run(sql, values)
    end


    def delete()
      sql = "DELETE FROM castings WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM castings"
    end

  end
