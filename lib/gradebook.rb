class Gradebook

  attr_reader :instructor, :courses

    def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses.push(course)
  end

  def list_all_students
    students = {}
    courses.each do |course|
      students[course] = course.students
    end
    students
  end

  def students_below(threshold)
    students = []
    courses.each do |course|
      course.students.each do |student|
        if student.grade <= threshold
          students.push(student)
        end
      end
    end
    students
  end

end
