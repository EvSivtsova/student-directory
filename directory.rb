@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def student_data
  @students << {name: @name, cohort: "november".to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    student_data
    puts "Now we have #{@students.count} students"
    #get another name from the user
    @name = STDIN.gets.chomp
  end
  # return the array pf students
  @students
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, cohort = line.chomp.split(',')
    student_data
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu

