# Define class SolarSystem
class SolarSystem
  attr_reader :planets

  def initialize planet_list
    @planets = planet_list
  end

  def add new_planet
    @planets << new_planet
  end

  def print_planet_list
    planet_list_to_print = "Planet list:\n"
    @planets.each { |planet|
      planet_list_to_print << planet.name + "\n"
    }
    return planet_list_to_print
  end

  def print_planet_details
    planet_details_to_print = "Planet details:\n"
    @planets.each { |planet|
      planet_details_to_print << planet.info + "\n"
    }
    return planet_details_to_print
  end
end

# Define class Planet
class Planet
  attr_reader :name, :year_length, :distance_from_the_sun, :diameter, :mass, :moons

  def initialize name, year_length, distance_from_the_sun, diameter, mass, moons
    @name = name
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @diameter = diameter
    @mass = mass
    @moons = moons
  end

  def info
    info_message = "--#{@name}--\n\tyear length - #{@year_length} days\n\tdistance from the sun - #{@distance_from_the_sun} km\n\tdiameter - #{@diameter} km\n\tmass - #{@mass} kg\n\tmoons - #{@moons}"
    return info_message
  end
end

# Hard-coded data
mercury = Planet.new("Mercury", 88, 57909227, 4879, "3.30 x 10^23", 0)
venus = Planet.new("Venus", 225, 108209475, 12104, "4.87 x 10^24", 0)
planets = [mercury, venus]
my_solar_system = SolarSystem.new(planets)
puts my_solar_system.print_planet_list
puts my_solar_system.print_planet_details

earth = Planet.new("Earth", 365.24, 149598262, 12714, "5.97 x 10^24", 1)
my_solar_system.add(earth)
puts my_solar_system.print_planet_list
puts my_solar_system.print_planet_details
