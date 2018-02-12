# Solar System project -create an object which contains a
# collection of other objects

require 'colorize'

class SolarSystem
  # create a constructor to add planet name
  def initialize(planets)
    @planets = planets
  end
  
  attr_accessor :planets
  
  def list
    num = 1
    @planets.each do |arr|
      print "\n#{num}. #{arr.summary} ".cyan
      num += 1
    end
  end
end

# building multiple classes and composing these together
class Planet
  attr_accessor :name, :color, :orbital, :diameter, :distance
  
  # create a constructor to add planet attributes
  def initialize(name, color, orbital, diameter, distance)
    @name = name
    @color = color
    @orbital = orbital
    @diameter = diameter
    @distance = distance
  end
  # list attributes for each planet
  def summary
    " #{@name}\tColor: #{@color}, Orbital: #{@orbital}
    \t\tDiameter(km): #{@diameter}, Distance(km): #{@distance}\n"
  end
  
end

# Wave 2/3 "hashes" with 5 attributes now variables
mercury = Planet.new("Mercury", "silver", 0.24, 4879, 57909227)
venus = Planet.new("Venus", "beige", 0.616, 12104, 108209475)
earth = Planet.new("Earth", "green", 1, 12756, 149598262)
mars = Planet.new("Mars", "red", 1.9, 6792, 227943824)
jupiter = Planet.new("Jupiter","brown", 11.9, 142984,778340821)
neptune = Planet.new("Neptune", "blue", 164.8, 49528, 4498396441)

# Array for SolarSystem class
planets = [ mercury, venus, mars, earth, jupiter, neptune ]

solar = SolarSystem.new(planets)

# show a list of the planets
puts "\nHERE IS OUR LIST OF PLANETS:\n".cyan

num = 1

planets.each do |x|
  puts "#{num}. #{x.name}".cyan
  num += 1
end

# Ask the user if they would like to see more information
print "\nEnter (yes/no) if you would like to see more information: "
answer = gets.chomp.downcase

while answer == "yes"
  
  print "\nWhich planet would you like to know more of? "
  until (info = gets.chomp.capitalize).include?("#{@name}")
    puts "I'm sorry. Please select one from the list-- "
  end
  
  case info
  when "Earth"
    puts earth.summary.green
  when "Mercury"
    puts mercury.summary
  when "Mars"
    puts mars.summary.red
  when "Jupiter"
    puts jupiter.summary.yellow
  when "Neptune"
    puts neptune.summary.blue
  when "Venus"
    puts venus.summary.magenta
  end
  
  # ask the user if they would like to see any more information
  print "\nWould you like any more information? (yes/no): "
  answer = gets.chomp.downcase
  
end

# Ask the user if they would like to create their own planet
print "\nWould you like to create your own planet? (yes/no): "
create = gets.chomp.downcase

while create == "yes"
  
  # Ask for the planet's name
  print "\nEnter your planets' name: "
  new_name = gets.chomp.capitalize
  
  puts "That's not a planet...But I'll let you have it this time." if new_name == "Pluto"
  puts "Good choice!" if new_name == "Saturn"
  puts "I love Star Wars." if new_name == "Hoth" || new_name == "Tatooine" || new_name == "Jakku"
  
  # Ask the planet's color
  print "\nEnter #{new_name}s' color: "
  new_color = gets.chomp.downcase
  
  # Ask how long it takes to orbit the sun
  print "\nHow long does it take #{new_name} to orbit the Sun? (*earth years) "
  until (new_orbit = gets.chomp) =~ /^\d*\.?\d+$/
    puts "\nInvalid. Please enter a number: "
  end
  
  # Ask the diameter
  print "\nWhat is the diameter? (km) "
  until (new_diameter = gets.chomp) =~ /^\d*\.?\d+$/
    puts "\nInvalid. Please enter a number: "
  end
  
  # Ask how far the planet is from the sun
  print "\nWhat is #{new_name}s' distance from the Sun? "
  until (new_distance = gets.chomp) =~ /^\d*\.?\d+$/
    puts "\nInvalid. Please enter a number: "
  end
  # Add the planet to the SolarSystem class
  planets.push(new_name = Planet.new(new_name, new_color, new_orbit, new_diameter,
    new_distance))
    
    # Show the new edited list of planets
    puts "\nYOUR NEW PLANET IS NOW ON THE LIST-- ".cyan
    
    solar.list
    
    # Ask if the user would like to create more planets
    print "\nWould you like to create another planet? (yes/no): "
    create = gets.chomp.downcase
    
end
