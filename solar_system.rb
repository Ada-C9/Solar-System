# Display color string
require 'colorize'
# Solar system class
class SolarSystem
  # reader, writer methods
  attr_accessor :planets, :age

# Constructor
  def initialize planets, age = 5000000000
    @planets = planets
    @age = age
  end

# Adds planet
  def add_planet planet
    @planets.push(planet)
  end

# Returns a list of planets
  def list_of_planets
    list = []
    @planets.length.times do |index|
      list << "#{index+1}. #{@planets[index].name}"
    end
    return list
  end
end

class Planet
  attr_reader :name, :year_length, :distance_from_the_sun, :mass, :diameter, :atmospheric_components

  def initialize name, year, distance, mass, diameter, components
    @name = name
    @year_length = year
    @distance_from_the_sun = distance
    @mass = mass
    @diameter = diameter
    @atmospheric_components = components
  end

 # Display planet info in bold.
  def print_planet_info
    puts "☛ Planet #{@name} takes #{@year_length} earth days to go around its star.✰".bold
    puts ""
    puts "◆ It is #{@distance_from_the_sun} kilometers away from the sun ☀️ and has a mass of #{@mass} kilogram.".bold
    puts ""
    puts "◆ It's diameter is #{@diameter} kilometer and it has these atmospheric components: #{@atmospheric_components}.".bold
    puts ""
  end

# Calculate distance of the planet from other planet
  def distance_from_the_planet other_planet
    return (@distance_from_the_sun - other_planet.distance_from_the_sun).abs.round(2)
  end
end

# Ask user input for new planet variables and adds a new planet to solar system.
def add_new_planet our_solar_system
  puts "Please enter the planet name"
  planet_name = gets.chomp.capitalize
  print "Please enter the length of time the planet takes to go around its star in earth days. ➤ "
  year_length = gets.chomp.to_f.round(2)
  print "Please enter how far is the planet from the sun in kilometers. ➤ "
  distance_from_the_sun = gets.chomp.to_f.round(2)
  print "Please enter the mass of a planet in kilograms. ➤ "
  mass = gets.chomp
  print "Please enter a diameter of the planet in kilometers. ➤ "
  diameter = gets.chomp.to_f.round(2)
  print "Please enter what is the composition of the atmosphere. ➤ "
  atmospheric_components = gets.chomp

  new_planet = Planet.new(planet_name, year_length, distance_from_the_sun, mass, diameter, atmospheric_components)
  our_solar_system.add_planet(new_planet)
  puts "New planet #{planet_name} is added.".red
end

# Ask user to choose a planet and based on that prints info.
def show_planets our_solar_system
  all_planets = our_solar_system.planets
  puts "Choose which planet:"
  all_planets.length.times do |index|
    puts "#{index+1}: #{all_planets[index].name}"
  end
  puts "Which planet info you want"
  planet_choice = gets.chomp.to_i
  if planet_choice >=1 && planet_choice <= all_planets.length
    # Display all the planet objects in array.
    puts all_planets[planet_choice - 1].print_planet_info
    # Local variable which is assigned the planet that is selected
    choosen_planet = all_planets[planet_choice -1]
    all_planets.length.times do |index|
      # Skips the selected planet
      if planet_choice - 1 != index
        # Output the distance from other planet.
        puts "✹ The distance from #{all_planets[index].name} is #{choosen_planet.distance_from_the_planet(all_planets[index])} km.".bold
        puts ""
      end
    end
  end
end

planets_hash = [{ name: "Mercury", year_length: 87.97, distance_from_the_sun: 57909175, mass: "3.3 x 1023", diameter: 4879.4, atmospheric_components: "trace amounts of hydrogen and helium" }, { name: "Venus", year_length: 224.7, distance_from_the_sun: 108208930, mass: "4.87 x 1024", diameter: 12104, atmospheric_components: "96% carbon dioxide, 3% nitrogen, 0.1% water vapor" }, { name: "Earth 🌏", year_length: 365.26, distance_from_the_sun: 149597890, mass: "5.98 x 1024", diameter: "12756", atmospheric_components: "78% nitrogen, 21% oxygen, 1% argon" }, { name: "Mars", year_length: 686.98, distance_from_the_sun: 227936640, mass: "6.42 x 1023Kg", diameter: 6787, atmospheric_components: "95% carbon dioxide, 3% nitrogen, 1.6% argon" }, { name: "Jupiter", year_length: 4332.82, distance_from_the_sun: 778412020, mass: "1.90 x 1027", diameter: 142800, atmospheric_components: "90% hydrogen,10% helium, .07% methane" }]

# loops through planets_hash and push all planet object in an array.
array_planets = []
planets_hash.each do |planet_detail|
  planet_instance = Planet.new(planet_detail[:name], planet_detail[:year_length], planet_detail[:distance_from_the_sun], planet_detail[:mass], planet_detail[:diameter], planet_detail[:atmospheric_components])
  array_planets << planet_instance
end

# Creates a new instance of solar system.
our_solar_system = SolarSystem.new array_planets
puts "☽ ★ Welcome to Solar System. Our solar is system is 4.6 billion years old.❤︎".bold
puts "Enter 0 to add a planet and 1 to view planet info and 2 to exit."

until (choice = gets.chomp) == "2"
  if choice =~ /^[0-2]$/
    if choice == "0"
      add_new_planet our_solar_system
    else
      show_planets our_solar_system
    end
  end
  puts "Enter 0 to add a planet and 1 to view planet info and 2 to exit."
end
