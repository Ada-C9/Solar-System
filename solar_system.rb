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
      summary += "#{i + 1}. #{@planets[i][:name]}: attrA - #{@planets[i][:attrA]}, attrB - #{@planets[i][:attrB]} \n"
    }
    return summary
  end

end

planet_a = { name: "Planet A", attrA: "A", attrB: "B" }
planet_b = { name: "Planet B", attrA: "C", attrB: "D" }
my_solar_system = SolarSystem.new( [ planet_a, planet_b ] )
puts my_solar_system.list
puts "==================="
planet_c = { name: "Planet C", attrA: "E", attrB: "F" }
planet_d = { name: "Planet D", attrA: "G", attrB: "H" }
my_solar_system.add(planet_c)
my_solar_system.add(planet_d)
puts my_solar_system.list
