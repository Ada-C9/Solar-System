# Define the class Solar System
class SolarSystem
  attr_reader :planets, :age, :planet_names

  # Initialize @planets as an array of planet instances
  def initialize(planets)
    @planets = planets
    @age = 4600 # in million of years
    @planet_names = []
  end

  # Method to add planets to the array
  def add_planet(planet_to_add)
    @planets << planet_to_add
  end

  # Generates a list of planet names
  def list_planets
    planet_list = ''
    i = 0
    @planets.each do |planet|
      i += 1
      planet_list << "#{i}. #{planet.name.capitalize}\n"
    end
    planet_list
  end

  # This method finds the distance assuming they are in a straight line out from the sun.
  def find_distance_between_planets(planet_1, planet_2)
    information_hash = {}
    information_hash[:planet_1] = @planets[planet_1.to_i].name
    information_hash[:planet_2] = @planets[planet_2.to_i].name
    distance = @planets[planet_1.to_i].distance_from_sun - @planets[planet_2.to_i].distance_from_sun
    information_hash[:distance] = distance.abs

    information_hash
  end
end # End of Solar System class

class Planet
  attr_reader :name, :diameter, :distance_from_sun, :year_length, :color

  def initialize(attributes = {})
    @name = attributes[:name]
    @diameter = attributes[:diameter] # measured in km
    @distance_from_sun = attributes[:distance_from_sun] # measured in million km
    @year_length = attributes[:year_length] # measured in Earth years
    @color = attributes[:color]
  end

  def return_attributes
    planet_summary = "
    Name: #{@name}
    Diameter: #{@diameter}
    Color: #{@color}
    Length of Year (in Earth years): #{@year_length}
    Distance from the sun: #{@distance_from_sun} million km"
    planet_summary
  end
end # End of Planet class

# Initial message used to let the determine how they want to interact with the program.
def get_choice
  puts "\nThank you for using our Solar System Explorer! Here are your options:
  (A) Add a planet to the list
  (B) View a planet
  (C) Exit the program"
  print "\nPlease select a letter: "
  choice = gets.chomp.upcase
  choice
end

# If the user enters a planet name the first time, it will be accepted. If the user does not enter a correct number or name it will prompt them to enter an existing number until they do.
def valid_entry(solar_system)
  print 'Select a planet: '
  planet_number = gets.chomp

  # If user does not enter a valid name or number they will be prompted to enter again.
  until (planet_number.to_i.to_s == planet_number) && (planet_number.to_i <= solar_system.planets.length && planet_number.to_i > 0)
    print 'Please select a valid number to represent a planet: '
    planet_number = gets.chomp
  end
  planet_number = planet_number.to_i - 1
  planet_number
end

# (Choice A)
def create_new_planet
  planet = {}
  planet[:name] = ''
  while planet[:name] == ''
    puts 'Please enter the name of the planet you would like to add: '
    planet[:name] = gets.chomp.capitalize
  end
  puts 'Please provide the following attributes.'
  print 'Diameter(in km): '
  planet[:diameter] = gets.chomp
  print "Distance from the Sun (or it's star) (units: million km): "
  planet[:distance_from_sun] = gets.chomp
  print 'Length of Year (units: Earth years): '
  planet[:year_length] = gets.chomp
  print 'Color: '
  planet[:color] = gets.chomp

  planet_object = Planet.new(planet)
  planet_object
end

# (Choice B)
def view_planet_summary(solar_system)
  puts "Choose a planet to view some of it's information: "
  puts solar_system.list_planets
  planet_chosen = valid_entry(solar_system)
  puts solar_system.planets[planet_chosen].return_attributes
end

# (Choice C)

def leave_program
  puts 'Thank you! Have a nice day!'
  exit
end

# Pre-populated solar system
# distance from sun is represented in million km.
planets_in_ss = [
  {
    name: 'Mercury',
    diameter: 4_878,
    color: 'gray',
    year_length: 0.241,
    distance_from_sun: 57.9
  },
  {
    name: 'Venus',
    diameter: 12_104,
    color: 'yellow',
    year_length: 0.615,
    distance_from_sun: 108.2
  },
  {
    name: 'Earth',
    diameter: 12_760,
    color: 'blue',
    year_length: 1,
    distance_from_sun: 149.6
  },
  {
    name: 'Mars',
    diameter: 6_787,
    color: 'red',
    year_length: 1.88,
    distance_from_sun: 227.9
  },
  {
    name: 'Jupiter',
    diameter: 139_822,
    color: 'orange and white',
    year_length: 11.86,
    distance_from_sun: 778.3
  },
  {
    name: 'Saturn',
    diameter: 120_500,
    color: 'pale gold',
    year_length: 29.46,
    star_system: 'Solar',
    distance_from_sun: 1427
  }

]

# Creates an array of planet objects based on the planet hashes defined above.
solar_system_planets = []
planets_in_ss.each do |planet_hash|
  solar_system_planets << Planet.new(planet_hash)
end

# Creates a new solar system instance based on the planet instances
solar_system_object = SolarSystem.new(solar_system_planets)

# User interface
loop do
  choice = get_choice
  case choice
  when 'A'
    new_planet = create_new_planet
    solar_system_object.add_planet(new_planet)
  when 'B'
    view_planet_summary(solar_system_object)
  when 'C'
    leave_program
  else
    puts "\nI'm sorry that's not a valid selection. Please try again."
  end
end
