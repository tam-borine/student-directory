#require 'Date'

def input_students
  students = []
puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
while !name.empty? do
  puts "Please enter the cohort of this student"
  cohort = gets.chomp
  #while !Date::MONTHNAMES.include? cohort.capitalize do
  	#puts "Please enter a valid month eg. August or Aug"
  	#cohort = gets.chomp
 # end

  puts "Please enter their favourite food"
  food = gets.chomp

    # add the student hash to the array
  students << {name: name, cohort: cohort, food: food }
  #puts "Now we have #{students.count} students"
  # return the array of students
  puts 'Enter next name'
  name = gets.chomp

end
  students
end

def print_header
puts "The students of Villains Academy".center(60)
puts "-------------".center(60)
end

def print(students)
index = 0
while index < students.length
 puts "#{index + 1}. #{students[index][:name]} #{students[index][:cohort]} cohort "
	
index += 1
end
end

#def print_if_under12(students)
#quit if students.empty?
#students.each_with_index do |student,index| if student[:name].length < 12
 #puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort "
 #end
#end
#end

def print_if_1st_char_is (students)
	puts "What character would you like to name search by?"
	let = gets.chop
	students.each_with_index do |student,index| if student[:name][0] == let
	 puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort "
	 end
	end
end

def print_footer (students)
footer =  "Overall, we have #{students.count} great students"
if students.length == 1
        puts footer.chop
else
       puts footer
end
end

def sort_by_cohort(students)
	studenti = students.sort_by do |i|
	 i[:cohort]
	end
	puts studenti
end

def interactive_menu 
  students = []
  loop do
    #print menu and ask what user wants to do
    puts "1. Input students"
    puts "2. Sort by cohort"
    puts "3. Show the students"
    puts "9. to Exit"
    selection = gets.chomp

    case selection
    when '1'
      students = input_students
    when '2'
    	sort_by_cohort(students)
    when '3'
    	print_header
    	print(students)
    	print_footer(students)
    when '9'
    	exit 
    else 
    	"I don't know what you meant"
    end
  end
end

interactive_menu
#print_if_under12(students)
#print_if_1st_char_is (students)
#sort_by_cohort(students)


