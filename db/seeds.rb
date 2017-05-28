d = Time.now.strftime("%B %d,%Y")

student = Student.create(email: "choongkwern@hotmail.com", password: "password")
student2 = Student.create(email: "student@example.com", password: "password")
teacher = Teacher.create(email: "teacher@example.com", password: "password")

# Create Subjects
teacher.subjects.create(title:"Software Engineering")
teacher.subjects.create(title:"Artificial Intelligence")
teacher.subjects.create(title:"Data Structure & Algorithm")
teacher.subjects.create(title:"Communication Skill")

# Get Subjects
subject = teacher.subjects.first
subject1 = teacher.subjects.where(title:"Artificial Intelligence").first
subject2 = teacher.subjects.where(title:"Data Structure & Algorithm").first
subject3 = teacher.subjects.where(title:"Communication Skill").first

# Insert list for each subject
subject.lists.create(title: d)
subject1.lists.create(title: d)
subject2.lists.create(title: d)
subject3.lists.create(title: d)

# Insert tasks into lists
list = subject.lists.first
5.times do |i|
  list.tasks.create(title: "Finish SE Assignment #{i}")
end

list1 = subject1.lists.where(title: d).first
5.times do |i|
  list1.tasks.create(title: "Finish AI Assignment #{i}")
end

list2 = subject2.lists.where(title: d).first
5.times do |i|
  list2.tasks.create(title: "Finish DSA Assignment #{i}")
end

list3 = subject3.lists.where(title: d).first
5.times do |i|
  list3.tasks.create(title: "Finish Comm Skill Assignment #{i}")
end

# Add Student to Subject
subject.users.push([student, student2])
subject1.users.push([student, student2])
subject2.users.push([student, student2])
subject3.users.push([student, student2])


