def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #ask for the cohort
    month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    while true
      puts "What's your cohort? Select month"
      cohort = gets.chomp.capitalize
      if month.include?(cohort)
        # add the student hash to the array. Converts the cohort value to a symbol
        students << {name: name, cohort: cohort.to_sym}
        break
      end
    end
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array pf students
  students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)