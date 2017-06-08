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
student2 = Student.create(name: "Marcus Mu", 
                         email: "student@example.com", 
                         password: "password",
                         password_confirmation: "password")

NAME = [
  "Marcus Mu", 
  "Mah Qi Hao", 
  "Lim Shi Hern", 
  "Ong Li Sheng", 
  "Chanan Loh",
  "Tan Hao Lun",
  "Isaac Lim",
  "Josh Teh"
]
100.times do |i|
  Student.create(name: NAME[i],
                 email: "student#{i}@example.com",
                 password: "password",
                 password_confirmation: "password")
end
# Create Subjects
subject  = teacher.subjects.create(title: "Software Engineering")
subject1 = teacher.subjects.create(title: "Artificial Intelligence")
subject2 = teacher.subjects.create(title: "Data Structure & Algorithm")
subject3 = teacher.subjects.create(title: "Communication Skill")

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

  subject.users.push(Student.all)
end

Student.all.each do |student|
  5.times do 
    student.mark_task_done(Task.ids.sample).save
  end
end





