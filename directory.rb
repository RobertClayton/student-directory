@students = []
# a method so i don't have to write out students each time:
@villians = [ {name: "Dr. Hannibal Lecter", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Darth Vader", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Nurse Ratched", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Michael Corleone", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Alex DeLarge", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "The Wicked Witch of the West", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Terminator", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Freddy Krueger", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "The Joker", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Joffrey Baratheon", cohort: "evil".to_sym},#, hobbies: "default", country_of_birth: "default", height: "default"},
  {name: "Norman Bates", cohort: "evil".to_sym}#, hobbies: "default", country_of_birth: "default", height: "default"}
]


def input_students
  puts "Please enter the name and cohort of the students"
  puts "to finish, just hit return twise"
  puts "Name?"
  name = STDIN.gets.strip

  if name == 'v'
    @students = @villians
  elsif name == ''
    @students = []
  else
    while !name.empty? do
      puts "Cohort?"
      cohort = STDIN.gets.strip
      cohort = "default" if cohort == ""
      append_to_students(name, cohort)
      puts "now we have #{@students.count} students"
      puts "Name?"
      name = STDIN.gets.strip
    end
  end
end


def print_header
  if @students.length < 1
  else
    puts "The students of Villains Academy"
    puts "-------------"
  end
end


def print_students_list
  #Q1. print a number before the name:  .each_with_index
  #students.each_with_index do |students, index|
    #Q2. only print the students whose name begins with a specific letter:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)" if students[:name][0] == "a"

    #Q3. only print the students whose name is shorter than 12 characters:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)" if students[:name].length < 12

    #from original code:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)"
  #end

  sort_it

  #Q4. prints all students using while or until: made students => @students
  q4_loop = 0
  until q4_loop == @students.length
    puts "#{q4_loop+1}. #{@students[q4_loop][:name]} (#{@students[q4_loop][:cohort]} cohort)"#Q6 = .center(40)
    q4_loop += 1
  end
end


def print_footer
  if @students.length < 1
    puts "We don't have any students"
  elsif @students.length == 1
    puts "Overall, we have #{@students.length} great student"
  else
    puts "Overall, we have #{@students.length} great students"
  end
end


#Q8: grouped by cohorts:
def sort_it
  array_to_sort = []
  @students.collect.with_index { |stud, index| array_to_sort << ["#{index}", "#{stud[:cohort]}"] }
  array_to_sort = array_to_sort.sort_by { |a| a[1] }
  sorted_array = []
  array_to_sort.each do |x|
    sorted_array << @students[x[0].to_i]
  end
  @students = sorted_array
end

def show_students
  puts "--------------------------------------------------"
  print_header
  print_students_list
  print_footer
  puts "--------------------------------------------------"
  puts
end

def process(selection)
  case selection
    when "1"
      students = input_students
      puts
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = STDIN.gets.chomp
    # 3. do what the user has asked
    process(selection)
  end
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
  puts "-----"
  puts "SAVED"
  puts "-----"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "---------------------------------------------------"
    puts "Loaded #{@students.count} students from #{filename}"
    puts "---------------------------------------------------"
  else # if it doesn't exist
    puts "---------------------------------"
    puts "Sorry, #{filename} doesn't exist."
    puts "---------------------------------"
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    append_to_students(name, cohort)
  end
  file.close
end

def append_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
