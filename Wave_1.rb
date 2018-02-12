# hashes of planet information
planet_a = {
  name: "Mercury",
  size: 1516, #miles in diameter
  color: "dark gray",
  temp: 332, # degrees Fahrenheit average
  speed: 112000, #mph
  distance: 36 #million miles average from the sun
}
planet_b = {
  name: "Jupiter",
  size: 43441, #miles in diameter
  color: "dark orange",
  temp: -234, # degrees Fahrenheit average
  speed: 47051, #mph
  distance: 483 #million miles average from the sun
}
planet_c = {
  name: "Mars",
  size: 4222, #miles in diameter
  color: "golden brown",
  temp: -80, # degrees Fahrenheit average
  speed: 86871, #mph
  distance: 141 #million miles average from the sun
}
planet_d = {
  name: "Venus",
  size: 3760, #miles in diameter
  color: "light yellow",
  temp: 864, # degrees Fahrenheit average
  speed: 78341, #mph
  distance: 67, #million miles average from the sun
}
planet_e = {
  name: "Earth",
  size: 8000, #miles in diameter
  color: "blue",
  temp: 61, # degrees Fahrenheit average
  speed: 67000, #mph
  distance: 93, #mil lion miles average from the sun
}

planet_list = ["Mercury", "Jupiter", "Mars", "Venus", "Earth"]

class SolarSystem
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  # method to add new planets
  def add_planet(planet)
    @planets.push(planet)
  end

  # method that returns the array as a string
  def list
    list = ""
    i = 0
    @planets.each do |planet|
      list << "#{i+1}. #{planet}\n"
      i += 1
    end
    return list
  end

  def summary
    return "#{planets}"
  end

end

# test the SolarSystem class with methods to add a new planet
# set up the list from the array
my_solar_system = SolarSystem.new(planet_list)
my_solar_system.add_planet('Hoth')
the_list_to_print = my_solar_system.list

# prints out the list of planets from the planet_list array
puts the_list_to_print

# prints out the hashes
my_solar_system = SolarSystem.new( [ planet_a, planet_b, planet_c, planet_d, planet_e ] )
the_list_to_print = my_solar_system.list
puts the_list_to_print
