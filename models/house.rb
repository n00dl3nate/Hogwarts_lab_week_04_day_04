require_relative('../db/sql_runner')

class House

  attr_accessor :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options["name"]
    @logo = options["logo"]
  end

  def save

    sql = "INSERT INTO houses
    (
      name,
      logo
      )
      VALUES(
        $1,$2
      )
      RETURNING id;"
      values = [@name, @logo ]
      houses = SqlRunner.run(sql,values)
      @id = houses.first()['id'].to_i

  end

  def self.delete_all

    sql = "DELETE FROM houses"

    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    house =  SqlRunner.run(sql, [id])
    return House.new(house.first)
  end


end
