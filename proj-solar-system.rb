


class SolarSystem

 def initialize (planets)
  @planets = planets
 end

def printPlanet()
  to_string = ""
  for i in 0..@planets.length - 1
    to_string += (i + 1).to_s + ". " + @planets[i].printAttributes +  "\n"
  end
 return to_string
end

 def findPlanetname(planetname)
   for i in 0..@planets.length - 1
     planet = @planets[i]
     if planet.name == planetname
       return planet
     end
   end
   return nil
end

def addPlanet(planet)
  @planets.push(planet)
end

end


class Planet
  attr_reader :color, :distance, :diameter,:name

  def initialize (color,distance,diameter,name)

    @color = color
    @distance = distance
    @diameter = diameter
    @name = name
  end

   def summary
     return "#{@color}: #{@distance}"
   end

  def printAttributes()
      to_string = @name + ":" +
        @color +  " "+ @distance.to_s + "," +
        @diameter.to_s

      return to_string
  end
end

mars = Planet.new("rusty-red", 34.4, 123.4, "Mars")
puts mars.printAttributes()
puts mars.diameter

saturn = Planet.new("paleish-yellow",48.8, 190.3, "Saturn")
earth = Planet.new("green-blue",55.3,78.8, "Earth")
jupiter = Planet.new("banded-yellow-grey",89.3,78.3, "Jupiter")

solarSystem = SolarSystem.new([ mars, saturn, earth, jupiter])
#puts solarSystem.printPlanet()


puts "HEllO welcome to the program!"
puts "Select a planet to find out about it."
selected_planet = gets.chomp
found_planet = solarSystem.findPlanetname(selected_planet)

if found_planet.nil?
  puts "Sorry, I can't find that planet!"
else
  # puts found_planet.printAttributes()

  puts "Thanks for choosing a planet"
  puts "What would you like to know?"
  puts "You can learn about a planet's diameter, distance, or color"
  puts "Please select your choice."

  selected_attribute = gets.chomp

  if selected_attribute == "color"
    puts found_planet.color
  elsif selected_attribute == "diameter"
    puts found_planet.diameter
  elsif selected_attribute == "distance"
    puts found_planet.distance
  else
    puts "That is not a valid choice!"
  end

end


#puts planet.printPlanet()
