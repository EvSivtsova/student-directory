def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    #ask for the cohort
    month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    while true
      puts "What's your cohort? Select month"
      cohort = gets.chop.capitalize
      if month.include?(cohort)
        # add the student hash to the array. Converts the cohort value to a symbol
        students << {name: name, cohort: cohort.to_sym}
        break
      end
    end
    if students.count == 1
      puts "Now we have #{students.count} student"
    else 
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.gsub(/\n/, "")
  end
  # return the array pf students
  students
end

def cohort(students)
  # ask for input on which cohort to print
   puts "Which cohort would you like to print?"
   cohort_to_print = gets.strip.capitalize
   # create and array with the students from that cohort
   cohort_students = []
   students.map do |student|
     if student[:cohort].to_s.include?(cohort_to_print)
      cohort_students << student
     end
   end
   cohort_students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print(students)
   students.map do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
   end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  elsif names.count == 0
    puts "We have no students in this cohort"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students
students_to_print = cohort(students)
print_header
print(students_to_print)
print_footer(students_to_print)