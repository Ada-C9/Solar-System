# Maria I Velez - Octos - C9
# 12 Feb 2018
# Solar System program
# https://github.com/Ada-C9/Solar-System

### WAVE 2

class SolarSystem
  # Create an initialize method which should take a collection of planet names and store them in an @planets instance variable.
  def initialize(all_planets)
    @planets = all_planets
  end

  attr_accessor :planets

  # Create a method that adds a planet to the list (not using user input)
  def planets
    return @planets
  end

  # Create a method which will return, not print, a list of the planets as a String in this style
  def summary
    counter = 0
    temp_list = []
    @planets.each do | planet |
      counter += 1
      temp_list.push("#{counter}. #{planet.name}")
    #   puts "#{planet[:name]}"  <-- this is what I used for Wave 1
    puts "#{counter}. #{planet.name}"
    end
    return temp_list

  end
end


# Create a Planet class which will represent a planet
class Planet

    # Create reader methods to give a user access to read the instance variables.
    attr_reader :name, :mass, :color_from_afar, :equatorial_radius, :surface, :number_of_moons, :distance_from_the_sun

# Add an initialize method which takes several arguments and uses them to set the class' instance variables
  def initialize(name, mass, color_from_afar, equatorial_radius, surface, number_of_moons, distance_from_the_sun) # <-arguments or parameters go here
    @name = name
    @mass = mass
    @color_from_afar = color_from_afar
    @equatorial_radius = equatorial_radius
    @surface = surface
    @number_of_moons = number_of_moons
    @distance_from_the_sun = distance_from_the_sun
  end

# Create a method that returns the Planet's attributes in an easy to read fashion.
  def attributes
    return "\n\tPlanet Name: #{@name}\n\tMass: #{@mass}\n\tColor from Afar: #{@color_from_afar}\n\tEquatorial Radius: #{@equatorial_radius}\n\tSurface Topography: #{@surface}  \n\tNumber of Moons: #{@number_of_moons}\n\tDistance from the Sun: #{@distance_from_the_sun}"
  end

end

# Instances of each planet
mercury = Planet.new("Mercury", "3.3011 × 10^23 kg", "gray with white speckles", "2,439.7 km", "heavily cratered", "none", "46 to 70 million km")

venus = Planet.new("Venus", "4.8675 × 10^24 kg", "mostly orange", "6,052 km", "volcanic", "none", "average 108.2 million km")

earth = Planet.new("Earth", "5.97237 × 10^24 kg", "blue green", "6378.1 km", "mostly water", "1", "average 149.6 million km")

mars = Planet.new("Mars", "6.4171 × 10^23 kg", "reddish", "3396.2 ± 0.1 km", "dry and dusty", "2", "average 230 million km")

jupiter = Planet.new("Jupiter", "1.8982 × 10^27 kg", "marbled", "71,492 km", "not solid, mostly hydrogen and helium gas", "69", "average 75 million km")

uranus = Planet.new("Uranus", "8.6810±0.0013 × 10^25 kg", "icy blue", "25,559±4 km", "featureless", "27", "about 3 billion km")

# When printing the planet list or planet details, it should call the corresponding method in Planet
puts mercury.attributes
puts venus.attributes
puts earth.attributes
puts mars.attributes
puts jupiter.attributes
puts uranus.attributes

# Make your SolarSystem class take an array of Planets instead of hashes
planet_list = [mercury, venus, earth, mars, jupiter, uranus]
my_solar_system = SolarSystem.new(planet_list)
