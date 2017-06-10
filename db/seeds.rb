TEACHER_NAME = {
  "Dr Chia Wai Chong" => "Digital Image Processing",
  "Dr Yeong Lee Seng" => "Embedded System",
  "Ms Charis Kwan" => "Software Engineering",
  "Dr Adelina Tang" => "Artificial Intelligence",
  "Dr Chin Teck Min" => "Object-Oriented Programming"
}

STUDENT_NAME = [
  "Choong Kai Wern",
  "Marcus Mu", 
  "Mah Qi Hao", 
  "Lim Shi Hern", 
  "Ong Li Sheng", 
  "Chanan Loh",
  "Tan Hao Lun",
  "Isaac Lim",
  "Josh Teh"
]

TEACHER_NAME.each_with_index do |(name, subject), i| 
  teacher = Teacher.create(name: name,
                 email: "teacher#{i}@example.com",
                 password: "password",
                 password_confirmation: "password")
  teacher.subjects.create(title: subject)
end

STUDENT_NAME.each_with_index do |name, i|
  Student.create(name: name,
                 email: "student#{i}@example.com",
                 password: "password",
                 password_confirmation: "password")
end


Subject.all.each do |subject|
  rand(1...10).times do |i|
    subject.lists.create(title: "Week #{i+1}")
  end
end

dip = Subject.find_by_title("Digital Image Processing")
ai = Subject.find_by_title("Artificial Intelligence")
oop = Subject.find_by_title("Object-Oriented Programming")
es = Subject.find_by_title("Embedded System")
se = Subject.find_by_title("Software Engineering")

Subject.all.each do |subject|
  subject.lists.each_with_index do |list, i| 
    list.tasks.create(title: "Read Textbook, Chapter #{i+1}")
    list.tasks.create(title: "Complete tutorial #{i+1}")
    list.tasks.create(title: "Revised Slide for Week #{i+1}")

    list.tasks.create(title: "Research on Assignment 1") if i == 4
    list.tasks.create(title: "Working on Assignment 1") if i == 5
    list.tasks.create(title: "Prepare for Mock Test") if i == 7
  end

  subject.users.push Student.all
end


Student.all.each do |student|
  5.times do 
    student.mark_task_done(Task.ids.sample).save
  end
end





