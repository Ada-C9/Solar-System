# Solar System class
class SolarSystem
  
  attr_accessor :planets
  
  def initialize(my_planets)
    @planets = my_planets
  end
  
  # method that returns the array as a string
  def list_planets
    list = ""
    i = 0
    @planets.each do |planet|
      list << "#{i+1} - #{planet.name}\n"
      i += 1
    end
    
    list << "#{i + 1} - Create a new planet!"
    return list
  end
  
  # adds a new to the solar system
  def add new_planet
    @planets << new_planet
  end
  
end


# Planet class
class Planet
  
  attr_accessor :name, :size, :color, :temp, :speed, :year_length, :distance
  
  # initialize planet method
  def initialize(planet_attributes)
    @names = planet_attributes[:name]
    @sizes = planet_attributes[:size]
    @colors = planet_attributes[:color]
    @temps = planet_attributes[:temp]
    @speeds = planet_attributes[:speed]
    @year_length = planet_attributes[:year_length]
    @distances = planet_attributes[:distance]
  end
  
  # method that returns each planet's name from the hashes
  def name
    return "#{@names}"
  end
  
  # method that returns the Planet's attributes reading the instance variables
  def attributes
    list = "name: #{@names}
    size: #{@sizes} miles in diameter
    color: #{@colors}
    temperature: #{@temps} degrees Fahrenheit
    speed: #{@speeds} mph
    year_length: #{@year_length} days to go around the sun
    distance: #{@distances} million miles from the sun"
    return list
  end
  
end

# a method to create a new planet from user input
def create_planet
  new_planet ={}
  
  print "\nWhat is the name of the planet? "
  new_planet[:name] = gets.chomp.downcase.capitalize
  
  print "What is the size of #{new_planet[:name]} in diameter? "
  new_planet[:size] = gets.chomp.to_i
  
  print "What is the color of #{new_planet[:name]}? "
  new_planet[:color] = gets.chomp
  
  print "What is the temperature of #{new_planet[:name]}? "
  new_planet[:temp] = gets.chomp
  
  print "How many days to go around the sun? "
  new_planet[:year_length] = gets.chomp
  
  print "How far is #{new_planet[:name]} from the sun? "
  new_planet[:distance] = gets.chomp.to_i
  
  new_planet = Planet.new(new_planet)
  
  return new_planet
end

# a list of my planets in hashes
planet_a = Planet.new({
  name: "Mercury",
  size: 1516, #miles in diameter
  color: "dark gray",
  temp: 332, # degrees Fahrenheit average
  speed: 112000, #mph
  year_length: 87.97, #days
  distance: 36 #million miles average from the sun
})
planet_b = Planet.new({
  name: "Jupiter",
  size: 43441, #miles in diameter
  color: "dark orange",
  temp: -234, # degrees Fahrenheit average
  speed: 47051, #mph
  year_length: 4332.82, #days
  distance: 483 #million miles average from the sun
})
planet_c = Planet.new({
  name: "Mars",
  size: 4222, #miles in diameter
  color: "golden brown",
  temp: -80, # degrees Fahrenheit average
  speed: 86871, #mph
  year_length: 686.98, #days
  distance: 141 #million miles average from the sun
})
planet_d = Planet.new({
  name: "Venus",
  size: 3760, #miles in diameter
  color: "light yellow",
  temp: 864, # degrees Fahrenheit average
  speed: 78341, #mph
  year_length: 224.70, #days
  distance: 67, #million miles average from the sun
})
planet_e = Planet.new({
  name: "Earth",
  size: 8000, #miles in diameter
  color: "blue",
  temp: 61, # degrees Fahrenheit average
  speed: 67000, #mph
  year_length: 365.26, #days
  distance: 93, #mil lion miles average from the sun
})

# store instances in an array
my_planets = [planet_a, planet_b, planet_c, planet_d, planet_e]

# creating my solar system
my_solar_system = SolarSystem.new(my_planets)
the_list_to_print = my_solar_system.list_planets


# welcome message
puts "Welcome to my Solar System!"
puts "My solar system include: \n#{the_list_to_print}!"

# prompt input from user
print "Would you like to learn about one of my planets or create your own planet?
Please select a number from above. > "
user_input = gets.chomp.to_i

# if statement to read the creat planet method
# else list characteristics of chosen planet
if user_input == my_planets.count + 1
  new_planet = create_planet
  my_solar_system.add(new_planet)
  print "\nA new planet called #{new_planet.name} has been"
  puts " added to my solar system. Thanks for visiting!"
else
  puts "\nHere's the information for #{my_planets[user_input - 1].name}"
  puts my_planets[user_input - 1].attributes
end
