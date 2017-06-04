require 'faker'

d = Time.now.strftime("%B %d,%Y")

teacher = Teacher.create(name: "Mehran Sahami", 
                         email: "teacher@example.com", 
                         password: "password",
                         password_confirmation: "password")
student = Student.create(name: "Choong Kai Wern", 
                         email: "choongkwern@hotmail.com", 
                         password: "password",
                         password_confirmation: "password")
student2 = Student.create(name: "Peter Parker", 
                         email: "student@example.com", 
                         password: "password",
                         password_confirmation: "password")


100.times do |i|
  Student.create(name: Faker::Name.name,
                 email: "student#{i}@example.com",
                 password: "password",
                 password_confirmation: "password")
end
# Create Subjects
subject  = teacher.subjects.create(title: "Software Engineering")
subject1 = teacher.subjects.create(title: "Artificial Intelligence")
subject2 = teacher.subjects.create(title: "Data Structure & Algorithm")
subject3 = teacher.subjects.create(title: "Communication Skill")

5.times do 
  teacher.subjects.create(title: Faker::Educator.course)
end

Subject.all.each do |subject|
  rand(1...10).times do |i|
    subject.lists.create(title: "Week #{i+1}", is_hidden: [true, false].sample)
  end
end

Subject.all.each do |subject|
  subject.lists.each do |list|
    rand(1...5).times do |i|
      list.tasks.create(title: "Finish #{Faker::Team.name}")
    end
  end
end

Subject.all.each do |subject|
  rand(1...100).times do 
    subject.users.push(User.find(rand(2..100)))
  end
end



