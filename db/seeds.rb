# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
d = Time.now.strftime("%B %d,%Y")

student = Student.create()
student.subjects.create(title:"Software Engineering")

subject = student.subjects.first
subject.lists.create(title: d)

list = subject.lists.first

10.times do |i|
  list.tasks.create(title: "Finish SE Assignment #{i}")
end

