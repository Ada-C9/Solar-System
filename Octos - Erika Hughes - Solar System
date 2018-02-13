# Create a Solar System class
class SolarSystem

  attr_accessor :planets
# Initialize method..
  def initialize(planets)
    @planets = planets
  end
# add planets..
  def add_planets(planet)
    @planets << planet
  end
# return list of planets...
  def list_planets
    @planets.each do |planet|
      planet
    end
  end
end 
# Create a Planet class
class Planet

  attr_reader :name, :color, :size, :distance, :temp
# initialize method.. attributes
  def initialize(name, color, size, distance, temp)
    @name = name
    @color = color
    @size = size
    @distance = distance
    @temp = temp
  end

  def list_characteristics
    return "The planet, #{@name} is #{@color} and is #{@size} compared to it's counterparts. It is #{@distance} miles from the sun and has a #{temp} climate."
  end
end #end of Planets class
puts "Welcome to my Solar System!"

venus = Planet.new("Venus", "pink", "small", "60,000,000", "cold")
mercury = Planet.new("Mercury", "orange", "medium", "40,000,000", "hot")
saturn = Planet.new("Saturn", "blue", "huge", "10,000,000", "cold")
mars = Planet.new("Mars", "white", "small", "50,000,000", "warm")

all_planets = [venus, mars, mercury]

solar = SolarSystem.new(all_planets)
solar.add_planets(saturn)

#UI - Selection and add planets
puts "Please choose a planet: Venus, Mercury, Saturn, or Mars? (You may also enter your own!)"
user_selection = gets.chomp.downcase
case user_selection
when "venus"
  puts venus.list_characteristics
when "mercury"
  puts mercury.list_characteristics
when "saturn"
  puts saturn.list_characteristics
when "mars"
  puts mars.list_characteristics
else
  puts "Enter the following about your planet!"
  print "Enter the planet's name: "
  name = gets.chomp.to_s
  print "Enter the planet's color: "
  color = gets.chomp.to_s
  print "Enter the planet's size: "
  size = gets.chomp.to_s
  print "Enter the planet's distance from the sun: (number only) "
  distance = gets.chomp.to_s
  print "Enter the planet's climate: "
  temp = gets.chomp.to_s

  user_planet = Planet.new(name, color, size, distance, temp)
  solar.add_planets(user_planet)

  puts "Awesome! #{user_planet.list_characteristics}"
end
