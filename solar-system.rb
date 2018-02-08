# Define a solar system class
class Solar_System

attr_accessor :planets
def initialize(planets)
  @planets = planets
end

def add(new_planet)
  @planets.push(new_planet)

end

def summary
  return @planets
end

end


planet_array =["Mercury", "Venus", "Earth"]
our_solar_system = Solar_System.new(planet_array)
our_solar_system.add("Mars")
puts our_solar_system.summary
