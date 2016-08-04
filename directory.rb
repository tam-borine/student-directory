#require 'Date'
@students = []
def input_students
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
  @students << {name: name, cohort: cohort, food: food }
  #puts "Now we have #{students.count} students"
  # return the array of students
  puts 'Enter next name'
  name = gets.chomp

end
end

def print_header
puts "The students of Villains Academy".center(60)
puts "-------------".center(60)
end

def print
index = 0
while index < @students.count
 puts "#{index + 1}. #{@students[index][:name]} #{@students[index][:cohort]} cohort "
	
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

def print_footer
footer =  "Overall, we have #{@students.count} great students"
	if @students.length == 1
        puts footer.chop
	else
       puts footer
	end
end

def sort_by_cohort
	studenti = @students.sort_by do |i|
	 i[:cohort]
	end
	puts studenti
end

def print_menu
    puts "1. Input students"
    puts "2. Sort by cohort"
    puts "3. Show the students"
    puts "4. Save to file"
    puts "9. to Exit"
end

def show_students
	print_header
    print
    print_footer
end

def save_students
	file = File.open("students.csv", "w")

	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:food]]
		csv_line = student_data.join(',')
		file.puts csv_line
	end
	file.close
end


def process selection
	case selection
    when '1'
      	input_students
    when '2'
    	sort_by_cohort
    when '3'
    	show_students
    when '4'
    	save_students
    when '9'
    	exit 
    else 
    	"I don't know what you meant"
    end
end
	

def interactive_menu 
  loop do
    #print menu and ask what user wants to do
    print_menu
    process gets.chomp
  end
end

interactive_menu
#print_if_under12(students)
#print_if_1st_char_is (students)
#sort_by_cohort(students)

