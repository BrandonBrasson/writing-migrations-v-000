require_relative 'spec_helper'



 describe 'student' do
  before :each do
    sql = "DROP TABLE IF EXISTS students"
    ActiveRecord::Base.connection.execute(sql)
    CreateStudents.new.change
    AddGradeAndBirthdateToStudents.new.change
    Student.reset_column_information
  end

  it 'has a grade' do
    student = Student.create(name: "Steven", grade: 12, birthdate: "April 5th")
    expect(Student.where(grade: 12).first).to eq(student)
  end

  it 'has a string birthdate' do
    student = Student.create(name: "Steven", grade: 12, birthdate: "April 5th")
    expect(Student.where(birthdate: "April 5th").first).to eq(student)
  end
end
