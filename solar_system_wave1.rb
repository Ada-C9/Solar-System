# Maria I Velez - Octos - C9
# 12 Feb 2018
# Solar System program
# https://github.com/Ada-C9/Solar-System

### WAVE 1
# Create a SolarSystem class with an @planets instance variable.
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
     temp_list.push("#{counter}. #{planet[:name]}")

#   puts "#{counter}. #{planet[:name]}"
   end
   return temp_list

 end
end


mercury = {
  name: "Mercury",
  mass: "3.3011 × 10^23 kg",
  color_from_afar: "gray with white speckles",
  equatorial_radius: "2,439.7 km",
  surface: "heavily cratered",
  number_of_moons: "none",
  distance_from_the_sun: "46 to 70 million km"
}

venus = {
  name: "Venus",
  mass: "4.8675 × 10^24 kg",
  color_from_afar: "mostly orange",
  equatorial_radius: "6,052 km",
  surface: "volcanic",
  number_of_moons: "none",
  distance_from_the_sun: "average 108.2 million km"
}

earth = {
  name: "Earth",
  mass: "5.97237 × 10^24 kg",
  color_from_afar: "blue green",
  equatorial_radius: "6378.1 km",
  surface: "mostly water",
  number_of_moons: "1",
  distance_from_the_sun: "average 149.6 million km"
}

mars = {
  name: "Mars",
  mass: "6.4171 × 10^23 kg",
  color_from_afar: "reddish",
  equatorial_radius: "3396.2 ± 0.1 km",
  surface: "dry and dusty",
  number_of_moons: "2",
  distance_from_the_sun: "average 230 million km"
}

jupiter = {
  name: "Jupiter",
  mass: "1.8982 × 10^27 kg",
  color_from_afar: "marbled",
  equatorial_radius: "71,492 km",
  surface: "not solid, mostly hydrogen and helium gas",
  number_of_moons: "69",
  distance_from_the_sun: "average 75 million km"
}

uranus = {
  name: "Uranus",
  mass: "8.6810±0.0013 × 10^25 kg",
  color_from_afar: "ice blue",
  equatorial_radius: "25,559±4 km",
  surface: "featureless",
  number_of_moons: "27",
  distance_from_the_sun: "about 3 billion km"
}

planet_list = [mercury, venus, earth, mars, jupiter, uranus]

# A new instance of the SolarSystem class
my_solar_system = SolarSystem.new(planet_list)

# This is how Wave 1 prints the list of planets
puts my_solar_system.summary # 
