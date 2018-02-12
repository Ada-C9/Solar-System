# CLASSES
# SolarSystem Class
class SolarSystem

  attr_reader :planets

  def initialize(planets, age)
    @planets = planets
    @age = age
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def planet_list
    value = ""
    @planets.each_with_index do |planet, i|
      value += "\t\t#{i+1}. #{planet.name}\n"
    end
    return value
  end

end

# Planet Class
class Planet

  attr_reader :name, :diameter, :distance, :year_length, :moons

  def initialize(name, diameter, distance, year_length, moons)
    @name = name
    @diameter = diameter
    @distance = distance
    @year_length = year_length
    @moons = moons
  end

  def attributes
    return "\t* Planet Name: #{@name}\n\t* Diameter: #{@diameter} km\n\t* Distance From The Sun: #{@distance} km\n\t* Days in a Year: #{@year_length}\n\t* Number of Moons: #{@moons}"
  end

end

# METHODS
# Create Method

def create_planet(solarsystem)
  puts "\nOk. Let's create a planet!"

  #Ask user for input about each attribute.
  puts "\nPlease enter your new planet's attributes"
  print "Planet Name: "
  name = gets.chomp
  print "Diameter in km: "
  diameter = gets.chomp.to_i
  print "Distance from the Sun in km: "
  distance = gets.chomp.to_i
  print "Days in a Year: "
  year_length = gets.chomp.to_i
  print "Number of Moons: "
  moons = gets.chomp.to_i
  # Create instance of Planet with information entered
  new_planet = Planet.new(name, diameter, distance, year_length, moons)
  # add new planet to solar system, so it appears on list.
  solarsystem.add_planet(new_planet)
end

# Print Options Method

def print_options(option, solarsystem)

  # Show the terminal a list of planets
  puts "\nBelow is a list of planets in our solar system:\n"
  puts "-".center(45,"-")
  puts"\n#{solarsystem.planet_list}\n"

  # Show the terminal options menu
  puts "-".center(45,"-")
  puts "MENU".center(45,"-")
  puts "-".center(45,"-")
  puts "\nType the planet name or number to learn more."
  puts "Type 'new planet' to make your own planet"
  puts "Type 'exit' to leave the program.\n\n"

  # Get user input about next actions
  option = gets.chomp.downcase
  return option

end

# Make multiple instances of Planet
# Each was a string, then a hash, now a Planet
# REMEMBER: Planet.new(name, diameter, distance, year_length, moons)
planet_1 = Planet.new("Mercury", 4879, 57909227, 88, 0)
planet_2 = Planet.new("Venus", 12104, 108209475, 225, 0)
planet_3 = Planet.new("Earth", 12742, 149598262, 365.24, 1)
planet_4 = Planet.new("Mars", 6779, 227943824, 693.956, 2)
planet_5 = Planet.new("Jupiter", 139822, 778340821, 4346.356, 53)
planet_6 = Planet.new("Saturn", 116464, 1426666422, 10774.58, 53)
planet_7 = Planet.new("Uranus", 50724, 2870658186, 30680.16, 27)
planet_8 = Planet.new("Neptune", 49244, 4498396441, 60191.552, 14)

# Store instances in an array
my_planets = [planet_1, planet_2, planet_3, planet_4, planet_5, planet_6, planet_7, planet_8]

# Show the terminal a Welcome
puts "\n\nWelcome! Hope you're ready to learn about the solar system!\n"

# Make an instance of Solar System
sol_sys = SolarSystem.new(my_planets, 1000000)

# Print list of options and store output
option = print_options("", sol_sys)

# If the user types "exit", leave program
# Otherwise, take action on the typed message
until option == "exit"
  if option == "new planet"
    create_planet(sol_sys)
    puts "\nThanks!  Your planet has been added!"
  else
    value = "\nSorry, that planet is not in our solar system!\n"
    sol_sys.planets.each_with_index do |planet, i|
      if option.to_i == i+1 || option == planet.name.downcase
        value = "\n\t\tCHOICE DESCRIPTION: \n\n#{planet.attributes}\n"
      end
    end
    puts value
  end

  # Repeat printing list and store output
  option = print_options("", sol_sys)
end

# Show goodbye message before exiting
puts "\n:) Thanks for learning with me! Have a good day! :)\n\n"
