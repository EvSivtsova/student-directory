@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
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
    puts "You've selected option 1"
    input_students
  when "2"
    puts "You've selected option 2"
    show_students
  when "3"
    puts "You've selected option 3"
    filename
    save_students
  when "4"
    puts "You've selected option 4"
    filename
    load_students(@filename)
  when "9"
    puts "You've selected option 9"
    exit # this will cause the program to terminateelse
  else
    puts "I don't know what you meant, try again"
  end
end

def student_data
  @students << {name: @name, cohort: "november".to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    student_data
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
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
  file = File.open(@filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  #file.close
end

def load_students(filename)
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
      student_data
    end
  end
end

def try_load_students
  # first argument from the command line
  filename = ARGV.first
  if filename.nil? || ! File.exists?(filename) # load students.csv if no file is given on startup
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv"
  else
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  end
end

def filename
    puts "Which file you would like to open:"
    @filename = STDIN.gets.chomp
end

try_load_students
interactive_menu

