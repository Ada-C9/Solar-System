# Define a solar system class
class Solar_System

attr_accessor :planets
def initialize(planets)
  @planets = planets
end

def summary
  return @planets
end

end


planet_array =["Mercury", "Venus", "Earth"]
our_solar_system = Solar_System.new(planet_array)
puts our_solar_system.summary
