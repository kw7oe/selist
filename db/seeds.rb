# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
d = Time.now.strftime("%B %d,%Y")

student = Student.create(email: "choongkwern@hotmail.com", password: "password")
student.subjects.create(title:"Software Engineering")
student.subjects.create(title:"Artificial Intelligence")
student.subjects.create(title:"Data Structure & Algorithm")
student.subjects.create(title:"Communication Skill")

#More test data
subject = student.subjects.first
subject1 = student.subjects.where(title:"Artificial Intelligence").first
subject2 = student.subjects.where(title:"Data Structure & Algorithm").first
subject3 = student.subjects.where(title:"Communication Skill").first

#Insert list for each subject
subject.lists.create(title: d)
subject1.lists.create(title: d)
subject2.lists.create(title: d)
subject3.lists.create(title: d)


#Insert tasks into lists
list = subject.lists.first
10.times do |i|
  list.tasks.create(title: "Finish SE Assignment #{i}")
end

list1 = subject1.lists.where(title: d).first
10.times do |i|
  list1.tasks.create(title: "Finish AI Assignment #{i}")
end

list2 = subject2.lists.where(title: d).first
10.times do |i|
  list2.tasks.create(title: "Finish DSA Assignment #{i}")
end

list3 = subject3.lists.where(title: d).first
10.times do |i|
  list3.tasks.create(title: "Finish Comm Skill Assignment #{i}")
end


