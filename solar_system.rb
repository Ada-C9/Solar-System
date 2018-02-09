# Define class SolarSystem
class SolarSystem
  attr_reader :planets
  attr_reader :age

  def initialize planet_list, age
    @planets = planet_list
    @age = age
  end

  def add new_planet
    @planets << new_planet
  end

  def print_planet_list
    planet_list_to_print = "Planet list:\n"
    @planets.each { |planet|
      planet_list_to_print << planet.name + "\n"
    }
    return planet_list_to_print
  end

  def print_planet_details
    planet_details_to_print = "Planet details:\n"
    @planets.each { |planet|
      planet_details_to_print << planet.info + "\n"
    }
    return planet_details_to_print
  end
end

# Define class Planet
class Planet
  attr_reader :name, :year_length, :distance_from_the_sun, :diameter, :mass, :moons

  def initialize name, year_length, distance_from_the_sun, diameter, mass, moons
    @name = name
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @diameter = diameter
    @mass = mass
    @moons = moons
  end

  def info
    info_message = "--#{@name}--\n\tyear length - #{@year_length} days\n\tdistance from the sun - #{@distance_from_the_sun} km\n\tdiameter - #{@diameter} km\n\tmass - #{@mass} kg\n\tmoons - #{@moons}"
    return info_message
  end

  def distance_from_another_planet another_planet
    distance = (@distance_from_the_sun - another_planet.distance_from_the_sun).abs
    return distance
  end
end

# Collect information of a new planet from the user
def create_planet_by_user
  print "Let's create a planet from scratch. Please enter the name first: "
  name = gets.chomp
  print "What's the year length of this planet by day? "
  year_length = gets.chomp.to_f
  print "What's the distance from the sun by km? "
  distance_from_the_sun = gets.chomp.to_f
  print "Diameter of this planet by km? "
  diameter = gets.chomp.to_f
  print "Mass by kg? (example of format: 3.30 x 10^23 ) "
  mass = gets.chomp
  print "How many moons does this planet have? Enter 0 if there is none. "
  moons = gets.chomp.to_i
  planet = Planet.new(name, year_length, distance_from_the_sun, diameter, mass, moons)
  return planet
end

# Testing
# new_planet_1 = create_planet_by_user
# new_planet_2 = create_planet_by_user
new_planet_1 = Planet.new("Mercury", 88, 57909227, 4879, "3.30 x 10^23", 0)
new_planet_2 = Planet.new("Venus", 225, 108209475, 12104, "4.87 x 10^24", 0)
planets = [new_planet_1, new_planet_2]
age_of_sun = 4600000000
sun = SolarSystem.new(planets, age_of_sun)
puts sun.print_planet_list

# new_planet_3 = create_planet_by_user
new_planet_3 = Planet.new("Earth", 365.24, 149598262, 12714, "5.97 x 10^24", 1)
sun.add(new_planet_3)
puts sun.print_planet_details

puts "Distance between #{new_planet_1.name} & #{new_planet_2.name} is #{new_planet_1.distance_from_another_planet(new_planet_2)} km."
puts "The age of the current solar system is #{sun.age} earth years."

# Information about solar system (sun)
# mercury = Planet.new("Mercury", 88, 57909227, 4879, "3.30 x 10^23", 0)
# venus = Planet.new("Venus", 225, 108209475, 12104, "4.87 x 10^24", 0)
# earth = Planet.new("Earth", 365.24, 149598262, 12714, "5.97 x 10^24", 1)
