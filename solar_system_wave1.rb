# Create a SolarSystem class with an @planets instance variable.
# Create an initialize method which should take a collection of planet names and store them in an @planets instance variable.
# Create a method that adds a planet to the list (not using user input).
# Create a method which will return, not print, a list of the planets as a String.
# Write code to test your SolarSystem
# Modify SolarSystem's initialize method to take a list of hashes where each planet is sent as a hash with at least 5 attributes.

# Define the class
class SolarSystem

# reader for planet
  def planets
    return @planets
  end

# writer for planet
  def planets=(new_planet)
    @planets = new_planet
  end

  attr_accessor :order

# initialize method
  def initialize(planets)
    @planets = planets
  end

  def self.planets
    return @planets
  end

  @planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

end

# code to test
SolarSystem.planets.each_with_index do |planet, i|
  puts "#{i+1}. #{planet}"
end



mercury = { planets: "MercuryA", radius: 1516, moons: 0, rotation_period: 58.646, orbit_period: 0.2408467, rings: "No" }
venus = { planets: "VenusA", radius: 3760, moons: 0, rotation_period: -243.018, orbit_period: 0.61519726, rings: "No"}
earth  = { planets: "EarthA", radius: 6371, moons: 1, rotation_period: 0.99726968, orbit_period: 1.0000174, rings: "No" }
mars = { planets: "MarsA", radius: 3389, moons: 2, rotation_period: 1.026, orbit_period: 1.8808476, rings: "No" }
jupiter  = { planets: "JupiterA", radius: 69911 , moons: 69, rotation_period: 0.41354, orbit_period: 11.862615, rings: "Yes" }
saturn = { planets: "SaturnA", radius: 58232, moons: 62, rotation_period: 0.444, orbit_period: 29.447498, rings: "Yes" }
uranus  = { planets: "UranusA", radius: 25362 , moons: 27, rotation_period: -0.718, orbit_period: 84.016846, rings: "Yes" }
neptune  = { planets: "NeptuneA", radius: 24622 , moons: 14, rotation_period: 0.671, orbit_period: 164.79132, rings: "Yes" }

