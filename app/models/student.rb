class Student < User
    has_many :lists, :through=> :subjects
    has_many :tasks, :through=> :lists
end
