# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

student1 = Student.create :name => 'John Student', :email => 'john123@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

student2 = Student.create :name => 'Jane Student', :email => 'jane123@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

teacher = Teacher.create :name => 'Tan Do', :email => 'tando@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

teacher = Teacher.create :name => 'Chen Do', :email => 'Chendo@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

project1 = Project.create :subject => 'History', :name => 'History Project', :teacher_id => 1

project1.students << student1
project1.students << student2