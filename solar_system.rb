# Define class SolarSystem
class SolarSystem
  attr_reader :name, :age, :planets

  def initialize name, age, planets
    @name = name
    @age = age
    @planets = planets
  end

  def add new_planet
    @planets << new_planet
  end

  def planet_list
    planet_list = "Planet list:\n"
    @planets.each { |planet|
      planet_list << planet.name + " "
    }
    return planet_list
  end

  def planet_details
    planet_details = "Planet details:\n"
    @planets.each { |planet|
      planet_details << planet.info + "\n"
    }
    return planet_details
  end

  def calculate_age ref_planet
    return @age * 365.24 / ref_planet.yr_length
  end
end

# Define class Planet
class Planet
  attr_reader :name, :diameter, :mass, :yr_length, :dis_from_sun, :moons

  def initialize name, diameter, mass, yr_length, dis_from_sun, moons
    @name = name
    @diameter = diameter
    @mass = mass
    @yr_length = yr_length
    @dis_from_sun = dis_from_sun
    @moons = moons
  end

  def info
    info = """
    --#{@name}--\n\t
    diameter - #{@diameter} km\n\t
    mass - #{@mass} kg\n\t
    year length - #{@yr_length} days\n\t
    distance from the sun - #{@dis_from_sun} km\n\t
    moons - #{@moons}
    """
    return info
  end

  def distance_from another_planet
    distance = (@dis_from_sun - another_planet.dis_from_sun).abs
    return distance
  end
end

# Generate a planet based on user's inputs
def generate_planet
  print "Let's create a planet from scratch. Please enter its name first: "
  name = gets.chomp
  print "What's its diameter of this planet in km? "
  diameter = gets.chomp.to_f
  print "What's its mass in kg? (example of input format: 3.30 x 10^23 ) "
  mass = gets.chomp
  print "What's the year length of this planet in days? "
  yr_length = gets.chomp.to_f
  print "What's the distance from the sun to this planet in km? "
  dis_from_sun = gets.chomp.to_f
  print "How many moons does this planet have? Enter 0 if there is none."
  moons = gets.chomp.to_i
  planet = Planet.new(name, diameter, mass, yr_length, dis_from_sun, moons)
  return planet
end

# Testing
# new_planet_1 = create_planet_by_user
# new_planet_2 = create_planet_by_user
new_planet_1 = Planet.new("Mercury", 4879, "3.30 x 10^23", 88, 57909227, 0)
new_planet_2 = Planet.new("Venus", 12104, "4.87 x 10^24", 225, 108209475, 0)
planets = [new_planet_1, new_planet_2]
age = 4600000000
sun = SolarSystem.new("Sun", age, planets)
puts sun.planet_list

# new_planet_3 = create_planet_by_user
new_planet_3 = Planet.new("Earth", 12714, "5.97 x 10^24", 365.24, 149598262, 1)
sun.add(new_planet_3)
puts sun.planet_details

puts "Distance between #{new_planet_1.name} & #{new_planet_2.name} is #{new_planet_1.distance_from(new_planet_2)} km."
puts "The age of the #{sun.name} is #{sun.calculate_age(new_planet_2).to_i} #{new_planet_2.name} years."
