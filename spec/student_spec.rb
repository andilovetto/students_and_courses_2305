require 'rspec'
require './lib/student'

RSpec.describe Student do

  let(:student) { Student.new({name: "Morgan", age: 21}) }

  it 'exists_and_has_attributes' do
    expect(student).to be_a(Student)
    expect(student.name).to eq("Morgan")
    expect(student.age).to eq(21)
  end

  it 'can_log_and_average_scores' do
    expect(student.scores).to eq([])
    student.log_score(89)
    student.log_score(78)
    expect(student.scores).to eq([89, 78])
    expect(student.grade).to eq(83.5)
  end

  
end