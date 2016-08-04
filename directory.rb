#require 'Date'
@students = []
def append_to_stds(name, cohort, food)
  @students << {name: name, cohort: cohort, food: food }
end

def input_students
puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
while !name.empty? do
  puts "Please enter the cohort of this student"
  cohort = STDIN.gets.chomp
  #while !Date::MONTHNAMES.include? cohort.capitalize do
  	#puts "Please enter a valid month eg. August or Aug"
  	#cohort = gets.chomp
 # end

  puts "Please enter their favourite food"
  food = STDIN.gets.chomp

    # add the student hash to the array
  append_to_stds(name, cohort, food)  #puts "Now we have #{students.count} students"
  # return the array of students
  puts 'Enter next name'
  name = STDIN.gets.chomp

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
	let = STDIN.gets.chop
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
    puts "5. Load from file"
    puts "9. to Exit"
end

def show_students
	print_header
    print
    print_footer
end

def save_students
	puts "What filename do you want to save this file as?"
	filename = STDIN.gets.chomp
	file = File.open("students.csv", "w")

	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:food]]
		csv_line = student_data.join(',')
		file.puts csv_line
	end
	file.close
end

def load_students(filename = "students.csv")
	if filename = "students.csv"
		puts "what file do you want to load?"
		filename = STDIN.gets.chomp
	end
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, food = line.chomp.split(",")
		append_to_stds(name, cohort, food)	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end


def process selection
	case selection
    when '1'
      	input_students
      	puts "your input was added, select 3 to see"
    when '2'
    	sort_by_cohort
    	puts "sorted by cohort"
    when '3'
    	show_students
    when '4'
    	save_students
    	"students were saved succesfully"
    when '5'
    	load_students
    	"students were loaded succesfully"
    when '9'
    	puts "Quitting the program"
    	exit 
    else 
    	"I don't know what you meant"
    end
end
	

def interactive_menu 
  loop do
    #print menu and ask what user wants to do
    print_menu
    process STDIN.gets.chomp
  end
end


#print_if_under12(students)
#print_if_1st_char_is (students)
#sort_by_cohort(students)
try_load_students
interactive_menu

