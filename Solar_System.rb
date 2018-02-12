require 'colorize'

class SolarSystem

  # Constractor
  def initialize(planets)
    @planets = planets
  end

  # Method who return the list of the planets with their properties and index
  def list_planets
    solar_system_details = ""
    @planets.each_with_index do |planet, i|
      solar_system_details += "#{i+1}. #{planet.get_description}\n"
    end
    return solar_system_details
  end

  # Method who return the planet according chosen index
  def get_planet(index)
    if index > 0 && index <= @planets.length
      return @planets[index-1]
    end
  end

  # Method who get a new planet and add it to the array
  def add_planet(new_planet)
    @planets << new_planet
  end
  
end

# my_planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Hoth"]


# my_planets = [
# {name: "Mercury", diameter: "4,879", moons: "0", temperature: "-173-427", gravity: "3.7"},
# {name: "Venus", diameter: "12,104", moons: "o", temperature: "462", gravity: "8.9},
# {name: "Earth", diameter: "12,756", moons: "1", temperature: "-88 to 58", gravity: "9.8"},
# {name: "Mars", diameter: "6,805", moons: "2", temperature: "-63", gravity: "3.7"},
# {name: "Jupiter", diameter: "142,984", moons: "67", temperature: "-108", gravity: "24.8"},
# {name: "Hoth", diameter: "7,200", moons: "3", temperature: "-60", gravity: "1.1"}
# ]


class Planet

  # Constractor
  def initialize(name, diameter, moons, temperature, gravity)
    @name = name
    @diameter = diameter
    @moons = moons
    @temperature = temperature
    @gravity = gravity
  end

  # Method who return the planet description
  def get_description
    return "name: #{@name}, Diameter: #{@diameter}, Moons: #{@moons}, Temperature: #{@temperature}, Gravity: #{@gravity}".green
  end

  # Getter for name properties
  def read_name
    return @name
  end

  # Getter for diameter properties
  def read_diameter
    return @diameter
  end

  # Getter for moons properties
  def read_moons
    return @moons
  end

  # Getter for temperature properties
  def read_temperature
    return @temperature
  end

  # Getter for gravity properties
  def read_gravity
    return @gravity
  end
end

# Creating a new objects of type Planet
new_planet = Planet.new("Mercury", "4,879", "0", "-173 to -427", "3.7")
new_planet1 = Planet.new("Venus", "12,104", "0", "462", "8.9")
new_planet2 = Planet.new("Earth", "12,742", "1", "-88 to 58", "9.8")
new_planet3 = Planet.new("Mars", "6,792", "2", "-87 to -5", "3.7")
new_planet4 = Planet.new("Jupiter", "142,984", "67", "-161", "24.8")
new_planet5 = Planet.new("Hoth", "7,200", "3", "-60", "1.1")

# Creating an array of objects
my_planets = [new_planet ,new_planet1, new_planet2, new_planet3, new_planet4, new_planet5]

# puts new_planet1.read_name
# puts new_planet.read_diameter
# puts new_planet.read_moons
# puts new_planet.read_temperature

# Creating a new objects of type SolarSystem and initializing it with planets array
my_solar_system = SolarSystem.new(my_planets)
# puts my_solar_system.list_planets

# Function that gets input from the user
# will continue until input is valid
def get_input(type)
  # Loop while input is empty
  input = ""
  while (input.empty?) do
    puts "Enter planet #{type}:"
    input = gets.strip
  end
  return input
end

# Output with welcome massege and asking for the user input for what the user wants to do
puts "Welcome to the Solar System"
answer = 0
until answer == "4"
  puts "What do you want to do?"
  puts "1. List planets"
  puts "2. Get planet detail"
  puts "3. Add planet"
  puts "4. Exit"
  answer = gets.chomp
  # Case statmants
  case answer
    # Answer "1" will print the planets list
  when "1"
    puts "Planets list:"
    puts my_solar_system.list_planets
    # Answer "2" will ask the user to choose a planet number.
    # if the input is valid it will print the chosen planet details,
    # else it will print wrong chice and it will start all over again
  when "2"
    puts "Please choose planet number"
    choice = gets.chomp.to_i
    chosen_planet = my_solar_system.get_planet(choice)
    if chosen_planet != nil
      puts "Here is the details for planet #{chosen_planet.read_name}"
      puts chosen_planet.get_description
    else
      puts "Wrong choice, please try again"
    end
    # Answer "3" will ask for user input for the planet details,
    # create a new planet with the input from the user and add it to my_solar_system array
  when "3"
    p_name = get_input("name")
    p_diameter = get_input("diameter")
    p_moons = get_input("moons")
    p_temperature = get_input("temperature")
    p_gravity = get_input("gravity")
    user_planet = Planet.new(p_name, p_diameter, p_moons, p_temperature, p_gravity)
    my_solar_system.add_planet(user_planet)
    # Answer "4" exit from the program
  when "4"
    puts "Good bye!!!"
    # This will happen if the input from the user is not valid (if the user input is not 1-4)
  else
    puts "Please choose 1-4"
  end
end
