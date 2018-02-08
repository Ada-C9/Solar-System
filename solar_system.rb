class SolarSystem

  def initialize planet_list
    @planets = planet_list
  end

  def add new_planet
    @planets << new_planet
  end

  def list
    summary = ""
    @planets.length.times { |i|
      summary += "#{i + 1}. #{@planets[i]} \n"
    }
    return summary
  end

end

planet_list = ["Mercury", "Venus", "Earth", "Mars", "Jupiter"]
my_solar_system = SolarSystem.new(planet_list)
puts my_solar_system.list
puts "==================="
my_solar_system.add("Saturn")
my_solar_system.add("Uranus")
my_solar_system.add("Neptune")
puts my_solar_system.list
