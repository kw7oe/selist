# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
d=Time.now.strftime("%B %d,%Y")
Subject.create(subject_title:"Software Engineering")
List.create(list_title:d,subject_id:1)
Task.create(task_title:"Finish SE Assignment",list_id:1)
Student.create()
Subjects_Users.create(subject_id:1,user_id:1)