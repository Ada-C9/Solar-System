

#Create Solarsystem class
class SolarSystem
  attr_accessor :planet,:size,:orbit,:diameter,:rotate,:distance

  def initialize(planet_name)
    @planet = planet_name
  end

  def addPlanetToList(planet_name)
    @planet << planet_name
  end
  def returnPlanetList
    @planet = planet
    planetList = ""
    @planet.each_with_index do |planet, index|
      planetList += "#{index+1}.  #{planet} \n"
    end
    return planetList
  end
end


planet_array= %w[Earth Mercury Venus Neptune Saturn Mars]
list_of_planet = SolarSystem.new(planet_array)
print list_of_planet.returnPlanetList


planet_1 = {name: "Mercury",size:"Smallest planet",orbital_speed:"47.8km/sec",diameter:"4878km",orbits_the_sun:"87.97days",distance_from_the_sun:"70millionkm"}
planet_2 = {name: "Uranus",size:"Sixth largest planet",orbital_speed:"35km/sec",diameter:"12,100km",orbits_the_sun:"243days",distance_from_the_sun:"108million km"}
my_solar_system = SolarSystem.new( [planet_1, planet_2])
print my_solar_system.returnPlanetList
