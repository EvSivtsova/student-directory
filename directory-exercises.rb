def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # asks for more infortmation
    puts "What your age?"
    age = gets.chomp
    puts "What is your height?"
    height = gets.chomp
    puts "What's your country of birth?"
    country_of_birth = gets.chomp
    puts "What are you hobbies?"
    hobbies = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, age: age, height: height, hobbies: hobbies, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print(students)
  count = 0
  while count < students.count
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      count += 1
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)