=begin students = [
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

def input_students
  students = []
while true  do
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty arra
 
  # get the first name
  name = gets.chomp
  puts "Please enter the cohort of this student"
  cohort = gets.chomp
  puts "Please enter their favourite food"
  food = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
   if name.length == 0 ; break ; end
  end
  # return the array of students
  students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print (students)
index = 0
while index < students.length

 puts "#{index + 1}. #{students[index][:name]} #{students[index][:cohort]} cohort "
index += 1 
end
end

def print_if_under12(students)
students.each_with_index do |student,index| if student[:name].length < 12 
 puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort "
 end
end
end

def print_if_1st_char_is (students)
puts "What character would you like to name search by?"
let = gets.chomp
students.each_with_index do |student,index| if student[:name][0] == let
 puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort "
 end
end
end

def print_footer (names)
puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
print_if_under12(students)
print_if_1st_char_is (students)
