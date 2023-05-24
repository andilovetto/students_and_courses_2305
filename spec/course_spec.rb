require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
  
  let(:course) { Course.new("Calculus", 2) }
  let(:student_1) { Student.new({name: "Morgan", age: 21}) }
  let(:student_2) { Student.new({name: "Jordan", age: 29}) }


  it 'exists_and_has_attributes' do
    expect(course).to be_a(Course)
    expect(course.name).to eq("Calculus")
    expect(course.capacity).to eq(2)
    expect(course.students).to eq([])
  end

  it 'can_enroll_students' do
    expect(course.full?).to eq(false)
    course.enroll(student_1)    
    course.enroll(student_2)
    expect(course.students).to eq([student_1, student_2])
    expect(course.full?).to eq(true)
  end

end