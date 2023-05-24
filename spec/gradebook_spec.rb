require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do 
  
  let(:course_1) { Course.new("Calculus", 2) }
  let(:course_2) { Course.new("Literature", 3) }
  let(:student_1) { Student.new({name: "Morgan", age: 21}) }
  let(:student_2) { Student.new({name: "Jordan", age: 29}) }
  let(:student_3) { Student.new({name: "Lily", age: 29}) }
  let(:gradebook) { Gradebook.new("Dr. John") }


  it 'exists_and_has_attributes' do
    expect(gradebook).to be_a(Gradebook)
    expect(gradebook.instructor).to eq("Dr. John")
  end

  it 'can_add_courses' do
    expect(gradebook.courses).to eq([])
    gradebook.add_course(course_1)
    gradebook.add_course(course_2)
    expect(gradebook.courses).to eq([course_1, course_2])
  end

  it 'can_list_all_students' do
    gradebook.add_course(course_1)
    gradebook.add_course(course_2)
    course_1.enroll(student_1)    
    course_1.enroll(student_2)
    course_2.enroll(student_3)
    expected = {
      course_1 => [student_1, student_2],
      course_2 => [student_3]
    }
    expect(gradebook.list_all_students).to eq(expected)
  end

  it 'evaluates students_below(threshold)' do
    student_1.log_score(89)
    student_2.log_score(55)
    gradebook.add_course(course_1)
    course_1.enroll(student_1)    
    course_1.enroll(student_2)
    expect(gradebook.students_below(56)).to eq([student_2])
  end

end