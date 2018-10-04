require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :last_name, :age, :id, :house_id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save

    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      age,
      house_id
      )
      VALUES(
        $1,$2,$3,$4
      )
      RETURNING id;"
      values = [@first_name,@last_name,@age,@house_id]
      students = SqlRunner.run(sql,values)
      @id = students.first()['id'].to_i

  end

  def self.delete_all

    sql = "DELETE FROM students"

    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    student =  SqlRunner.run(sql, [id])
    return Student.new(student.first)
  end

  def find_house()
    sql = "SELECT houses.name FROM houses
    INNER JOIN students
    ON students.house_id = houses.id
    WHERE students.id = $1;
    "
    values=[@id]
    house = SqlRunner.run(sql,values)
    return house.first['name']

  end

end
