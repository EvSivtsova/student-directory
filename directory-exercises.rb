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

# created a list of students whose starts with a specific letter
def students_letter(students)
  puts "Print the students whose name begins with a letter:"
  letter = gets.chomp.downcase
  students_letter = []
  students.each_with_index do |student, index|
    if student[:name].chr.downcase == letter
      students_letter << student
    end
  end
  students_letter
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
  puts "Overall, we have #{names.count} great students"
end
# =end

students = input_students
#shortened the array to those students whose names begin with a specific letter
students_l = students_letter(students)
print_header
print_list(students_l)
print_footer(students_l)