class Course

  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
    @full = false
  end

  def full?
    if @capacity == @students.count
      @full = true
    else
      @full
    end
  end

  def enroll(student)
    @students.push(student)
  end

end
