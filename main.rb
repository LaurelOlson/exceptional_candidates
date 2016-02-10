require 'pry'
require './candidates'
require './filters'
require './qualified'
require 'active_support/all'
require 'colorize'

# Displays the menu options to the user
def display_menu
  puts "Choose from the following options: \n
  to find a candidate, type 'find id' (ex. find 1)
  to view all candidates, type 'all'
  to view all qualified candidates, type 'qualified'
  to exit, type 'quit' 
  to view menu, type 'menu' \n\n"
end

# Returns the @candidates array showing all candidate info and whether each candidate is qualified or not
def show_all
  @candidates.each do |candidate|
    if ordered_by_qualifications.include?(candidate)
      pp candidate
      puts "qualified".colorize(:green)
    else
      pp candidate
      puts "unqualified".colorize(:red)
    end
  end
end

# Shows all qualified candidates
def show_qualified
  pp ordered_by_qualifications
end

# Given a candidate ID in the form "find ID", returns the information for that candidate
def show_id(input)
  index = /\d/.match(input)
  index = index.to_s.to_i + 1 - 1
  pp find(index)
end

# Displays menu and gets user response.
# Depending on user response, displays the relevant information.
# Exits the program if user types "quit".
def display_result
  display_menu
  input = gets.chomp

  while input != "quit"
    if input =~ /\Afind \d/
      show_id(input)
    elsif input == "all"
      show_all
    elsif input == "qualified"
      show_qualified
    elsif input == "menu"
      display_menu
    else
      puts "That is not a valid option"
    end

    puts "\n"
    input = gets.chomp
  end

  if input == "quit"
    return
  end
end

display_result



