

def input_students
  puts "Please enter the name and cohort of the students"
  puts "to finish, just hit return twise"
  students = []
  puts "Name?"
  name = gets.chomp
  while !name.empty? do
    puts "Cohort?"
    cohort = gets.chomp
    cohort = "default" if cohort == ""
    students << {name: name, cohort: cohort.to_sym, hobbies: "default", country_of_birth: "default", height: "default"}
    puts "now we have #{students.count} students"

    puts "Name?"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  #Q1. print a number before the name:  .each_with_index
  #students.each_with_index do |students, index|
    #Q2. only print the students whose name begins with a specific letter:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)" if students[:name][0] == "a"

    #Q3. only print the students whose name is shorter than 12 characters:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)" if students[:name].length < 12

    #from original code:
    #puts "#{index}. #{students[:name]} (#{students[:cohort]} cohort)"
  #end

  #Q4. prints all students using while or until: made students => @students
  q4_loop = 0
  until q4_loop == @students.length
    puts "#{q4_loop+1}. #{@students[q4_loop][:name]} (#{@students[q4_loop][:cohort]} cohort)"#Q6 = .center(40)
    q4_loop += 1
  end
end


def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end


@students = input_students
puts @students.inspect

print_header
print(@students)
print_footer(@students)




=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end
