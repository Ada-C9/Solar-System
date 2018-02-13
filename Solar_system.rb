# wave 2
class SolarSystem
  attr_accessor :planet_list
  # #initialize the method
  def initialize(planet_list)
    @planet_list = planet_list
  end

  # add new planet to list
  def add_planet(name, position, color, attr_a, attr_b)
    return @planet_list << planet_list
  end

  def list
    summary = ""
    i = 1
    @planet_list.each do |planet|
      summary += "#{i}.#{planet.name}\n"
      i += 1
    end
    return summary
  end

  def summary_sol
    return "The planets name is #{@name}. It is in the #{@position} position in the solar system. It is #{@color}. It has two random attributes that are #{@attr_a} and #{@attr_b}."
  end
  
  def list_summary
    summary = ""
    i = 1
    @planet_list.each do |planet|
      summary += "#{i}.#{planet.summary_sol}\n\n"
      i += 1
    end
    return summary
  end
end

# create a planet class which will represent a planet
class Planet
  # create a reader methods to give a user access to
  #read the instance variables
  attr_accessor :name, :position, :color, :attr_a, :attr_b
  # add an initialize method that will take in multiple arguments
  def initialize(name, position, color, attr_a, attr_b)
    @name = name
    @position = position
    @color = color
    @attr_a = attr_a
    @attr_b = attr_b
  end
  # create a method that will return the planets attributes in an
  # easy to read fashion
  def summary_user
    return "The planet you chose was #{@name}. It is in the #{@position} position in the solar system. It is #{@color}. It has two random attributes that are #{@attr_a} and #{@attr_b}."
  end

end



# make your SolarSystem class take an array of planets instead
# it should call corresponding method in Planet
planet_a = Planet.new("Mercury", "first", "gold", "love","hate")
planet_b = Planet.new("Venus", "second", "purple", "high", "low")
planet_c = Planet.new("Earth", "third", "green", "life", "death")
planet_d = Planet.new("Mars", "fourth", "red", "blah", "bleee")
planet_e = Planet.new("Jupiter", "fifth", "blue", "middle", "last")

planet_list = [planet_a, planet_b, planet_c, planet_d, planet_e]


my_solarsystem = SolarSystem.new(planet_list)
puts my_solarsystem.list

puts "\n\n"

# Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.

# welcome user to program
puts "Welcome to Kiera's weird Solar System!!!!"
puts "In this solar sytem you can choose a planet, learn information about it as well as add your own planets.\n\n"
puts "--------------Lets get started--------------\n\n"

# ask user what planet they would like information on
# Allow your user to add their own planet.
puts "There are 2 options of play with the Weird Solar System\n\n"
puts "Please choose an option number to continue"
puts "Option 1. Learn about a planet ---- OR ---- Option 2. Add a planet to the Solar System\n"
play_option = gets.chomp

puts "\n\n"



new_planet =[]
if play_option == "1"
  puts "Choose a planet you would like information on.\n"
  puts my_solarsystem.list
  puts "\n\n"
  user_option = gets.chomp
  puts "\n\n"
  case user_option
  when "mercury", "1"
    puts planet_a.summary_user
  when "venus", "2"
    puts planet_b.summary_user
  when "earth", "3"
    puts planet_c.summary_user
  when "mars", "4"
    puts planet_d.summary_user
  when "jupiter", "5"
    puts planet_e.summary_user
  else
    print "SORRY, That planet is not included in the list"
  end
elsif play_option == "2"
  puts "Choose a planet name"
  new_planet_name= gets.chomp
  new_planet << new_planet_name
  puts "Choose a planet position (number cannot be 1-5)"
  new_planet_position = gets.chomp
  new_planet << new_planet_position
  puts "Choose a planet color"
  new_planet_color = gets.chomp
  new_planet << new_planet_color
  puts "Choose an attribute"
  new_planet_attr_a = gets.chomp
  new_planet << new_planet_attr_a
  puts "Choose another attribute"
  new_planet_attr_b = gets.chomp
  new_planet << new_planet_attr_b
else
  puts "Sorry that is an incorrect option."
end

planet_g = Planet.new("new_planet_name", "new_planet_postiion", "new_planet_color", "new_planet_attr_a", "new_planet_attr_b")

print planet_g

planet_list << planet_g
puts my_solarsystem.list_summary
