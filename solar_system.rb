
# planet_names = [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Pluto" ] # wave 1a

mercury =
  {
    name: "Mercury",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

venus =
  {
    name: "Venus",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  earth =
  {
    name: "Earth",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  mars =
  {
    name: "Mars",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  jupiter =
  {
    name: "Jupiter",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  saturn =
  {
    name: "Saturn",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  uranus =
  {
    name: "Uranus",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }

  neptune =
  {
    name: "Neptune",
    distance_from_sun: 100,
    color: "blarb",
    moons: false,
    size: "large",
    sustains_life: false
  }
# instead of strings for planets, modify initialize method to take a list of hashes where each planet is sent as a hash with at least 5 attributes
planet_names = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
#new_planet = "Hoth"
hoth =
{
  name: "Hoth",
  distance_from_sun: 100,
  color: "blarb",
  moons: false,
  size: "large",
  sustains_life: false
}
new_planet = hoth

class SolarSystem

  def initialize(planet_names)
    @planets = planet_names
    #puts "Initializing beep boop"
  end

  def add_planet(new_planet)
    @new_planet = new_planet
    @planets.push(new_planet)
  end

  def return_planets
    planet_strings = "" #this is the string that will accumulate my return strings from the loop and then split them apart by new line
    idx = 1
    @planets.each do |planet|
        planet_strings += "#{idx}. #{planet[:name]} \n"
        idx += 1
    end
    return planet_strings

  end

end

class Planet
  attr_reader :name, :distance_from_sun, :color, :moons, :size, :sustains_life

  def initialize(name, distance_from_sun, color, moons, size, sustains_life)
    @name = name
    @distance_from_sun = distance_from_sun
    @color = color
    @moons = moons
    @size = size
    @sustains_life = sustains_life
  end

  planet_summary = ""
  def summarize_planet
    planet_summary = "Name: #{@name}\n" +
                     "Distance from Sun: #{@distance_from_sun}\n" +
                     "Color: #{@color}\n" +
                     "Moons: #{@moons}\n" +
                     "Size: #{@size}\n" +
                     "Sustains Life: #{@sustains_life}"
  end
end

mercury_planet = Planet.new("Mercury", 100, "gray", false, "small", false)
venus_planet = Planet.new("Venus", 200, "red", false, "large", false)
earth_planet = Planet.new("Earth", 300, "blue", true, "large", true)
mars_planet = Planet.new("Mars", 400, "red", true, "small", false)
jupiter_planet = Planet.new("Jupiter", 500, "green", true, "huge", false)
saturn_planet = Planet.new("Saturn", 600, "yellow", true, "large", false)
uranus_planet = Planet.new("Uranus", 700, "green", true, "small", false)
neptune_planet = Planet.new("Neptune", 800, "blue", true, "tiny", false)
hoth_planet = Planet.new("Hoth", 900, "black", true, "giant", false)


my_system = SolarSystem.new(planet_names)
puts "Solar System: Get Info and Add Planets"
puts "Would you like to add a planet? (y/n)"
adding_planet = gets.chomp.downcase
if adding_planet == "y"
  print "Name of planet: "
  name = gets.chomp
  print "Distance from sun: "
  distance = gets.chomp.to_i
  print "Color: "
  color = gets.chomp
  print "Moons (true/false): "
  moons = gets.chomp
  print "Size: "
  size = gets.chomp
  print "Sustains life (true/false): "
  life = gets.chomp
  user_planet = Planet.new(name, distance, color, moons, size, life)
  puts user_planet.summarize_planet

end

puts "Please choose to view info on one of the following planets (enter #): "
puts my_system.return_planets
user_planet_choice = gets.chomp.to_i

case user_planet_choice
when 1
  puts mercury_planet.summarize_planet
when 2
  puts venus_planet.summarize_planet
when 3
  puts earth_planet.summarize_planet
when 4
  puts mars_planet.summarize_planet
when 5
  puts jupiter_planet.summarize_planet
when 6
  puts saturn_planet.summarize_planet
when 7
  puts uranus_planet.summarize_planet
when 8
  puts neptune_planet.summarize_planet
end


# -------------------------------- testing --------------------
#my_system = SolarSystem.new(planet_names)
#my_system.add_planet(new_planet)
#puts my_system.return_planets

#another_planet = Planet.new("Gallifrey", 1000, "orange", true, "large", true)
#puts another_planet.summarize_planet
