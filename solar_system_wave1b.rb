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

  #attr_accessor :order,
  attr_accessor :radius
  attr_accessor :moons
  attr_accessor :rotation_period
  attr_accessor :orbit_period
  attr_accessor :rings


# initialize method
  def initialize(planets_hash)
    @planets = planets_hash[:planets]
    @radius = planets_hash[:radius]
    @moons = planets_hash[:moons]
    @rotation_period = planets_hash[:rotation_period]
    @orbit_period = planets_hash[:orbit_period]
    @rings = planets_hash[:rings]
  end

  def self.planets
    return @planets
  end

  #@planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

end

puts
mercury = SolarSystem.new ({
  planets: "MercuryA",
  radius: 1516,
  moons: 0,
  rotation_period: 58.646,
  orbit_period: 0.2408467,
  rings: "No"
})


venus = SolarSystem.new ({
  planets: "VenusA",
  radius: 3760,
  moons: 0,
  rotation_period: -243.018,
  orbit_period: 0.61519726,
  rings: "No"
})


earth  = SolarSystem.new ({
  planets: "EarthA",
  radius: 6371,
  moons: 1,
  rotation_period: 0.99726968,
  orbit_period: 1.0000174,
  rings: "No"
})

mars = SolarSystem.new ({
  planets: "MarsA",
  radius: 3389,
  moons: 2,
  rotation_period: 1.026,
  orbit_period: 1.8808476,
  rings: "No"
})

jupiter  = SolarSystem.new ({
  planets: "JupiterA",
  radius: 69911 ,
  moons: 69,
  rotation_period: 0.41354,
  orbit_period: 11.862615,
  rings: "Yes"
})

saturn = SolarSystem.new ({
  planets: "SaturnA",
  radius: 58232,
  moons: 62,
  rotation_period: 0.444,
  orbit_period: 29.447498,
  rings: "Yes"
})
uranus  = SolarSystem.new ({
  planets: "UranusA",
  radius: 25362 ,
  moons: 27,
  rotation_period: -0.718,
  orbit_period: 84.016846,
  rings: "Yes"
})
neptune  = SolarSystem.new ({
  planets: "NeptuneA",
  radius: 24622 ,
  moons: 14,
  rotation_period: 0.671,
  orbit_period: 164.79132,
  rings: "Yes" })

puts mercury.planets
puts
puts venus.planets
puts
puts earth.planets
puts
puts mars.planets
puts
puts jupiter.planets
puts
puts saturn.planets
puts
puts uranus.planets
puts
puts neptune.planets
puts
