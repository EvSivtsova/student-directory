def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array pf students
  students
end

# created a list of students whose names are shorter than 12 characters
def students_selected(students)
  students_l2_char = []
  students.each do |student|
    if student[:name].length < 12
      students_l2_char << student
    end
  end
  students_l2_char
end 

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print_list(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students whose names are shorter than 12 characters"
end
# =end

students_all = input_students
#shortened the array to those students whose names are shorter than 12 characters
students = students_selected(students_all)
print_header
print_list(students)
print_footer(students)