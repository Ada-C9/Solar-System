# Brittany Jones
# Ada Solar system
# Last edited 2/9/18

# Create a SolarSystem class with an @planets instance variable.
# Create an initialize method which should take a collection of planet names and store them in an @planets instance variable.

# Create a class with a hash of planets and their attributes.
# Give each planet a year_length attribute which is the length of time the planet takes to go around its star.
# Give each planet a distance_from_the_sun attribute

class Planet
  # Create reader methods to give a user access to read the instance variables.
attr_accessor :planet_hash
def initialize(name, color, moons, radius, distance_from_the_sun, year_length, fun_fact)
@planet_hash = {
"Name" =>  name,
"Color" =>  color,
"Moons" => moons,
"Radius"  => radius,
"Distance from the Sun" => distance_from_the_sun,
"Year Length" => year_length,
"Fun Fact" => fun_fact
    }
  end
end

#Create a SolarSystem class with an @planets instance variable.
#Make your SolarSystem class take an array of Planets instead of hashes. class will take an array of hashes, instead of hashes.
class SolarSystem
attr_accessor :planets
def initialize
@planets = planets
@planets = []
  end

def add_planet(planet)
@planets.push(planet)
  end

# Add planets to the @planets array.
def print
planets.each do |planet|
puts planet.name
    end
  end
end

mercury= Planet.new("This planet is named after the Roman deity Mercury, the messenger to the gods.", "Grey", "0", "1,516 miles", "35.98 million miles", "88 days", "Mercury is the closest planet to the Sun and is also the smallest of the eight planets in our solar system. For every 2 orbits of the Sun, which takes around 88 Earth days, Mercury completes three rotations of its axis.")

venus= Planet.new("Venus, the brightest planet in the night sky, was named after the Roman goddess of love and beauty.", "Orange", "0", "3,760 miles", "67.24 million miles", "225 days", "The surface of the planet is obscured by an opaque layer of clouds made up of sulphuric acid.")

earth= Planet.new("The Earth is the only planet in our solar system not to be named after a Greek or Roman deity.", "Blue and Green", "1", "3,959 miles", "92.96 million miles", "365.24 days", "The Earth was formed approximately 4.54 billion years ago and is the only known planet to support life.")

mars= Planet.new("Mars carries the name of the Roman god of war", "Red", "2", "2,106 miles" ,"141.6 million miles", "687 days", " Phobos (fear) and Deimos (panic) are the Red Planet's two small moons. They are named after the horses that pulled the chariot of the Greek war god Ares, the counterpart to the Roman war god Mars.")

jupiter= Planet.new("Jupiter was named after the king of the Roman gods.", "Red, orange, brown", "53", "43,441 miles", "483.8 million miles", "4380 days", "Jupiter is the fifth planet out from the Sun, and is two and a half times more massive than all the other planets in the solar system combined.")

hoth= Planet.new("Hoth is an ice planet in the Star Wars fictional universe.", "Blue, white", "3", "90 miles", "534 million miles", "38 days", "Hoth is home to only a few species, including the towering, predatory Wampa and the gray snow-lizards known as Tauntauns.")

# Create a method that returns the Planet's attributes in an easy to read fashion.
def print_attributes(planet)
each_planet = planet.planet_hash
each_planet.keys.each do |key|
puts "#{key}: #{each_planet[key]}"
  end
end

puts "Astrology 101: Take a look at some Planets in our Solar System"
puts "\n1. Mercury\n2. Venus\n3. Earth\n4. Mars\n5. Jupiter\n6. Hoth\n\nOf the planets listed, which one would you like to learn more about?\n\n"

planet_choice = gets.chomp.capitalize
puts "\n------------------------------------------------------------\n\n"

case planet_choice
when "Mercury"
print_attributes(mercury)
when "Venus"
print_attributes(venus)
when "Earth"
print_attributes(earth)
when "Mars"
print_attributes(mars)
when "Jupiter"
print_attributes(jupiter)
when "Hoth"
print_attributes(hoth)
else
  print "Would you like to enter your own planet?"
  create_new_planet=gets.chomp.capitalize
  if create_new_planet == "Yes"
    puts "What is the name of your planet?"
    new_planet_name = gets.chomp.capitalize
  end
 new_planet_name = Planet.new("Hoth is an ice planet in the Star Wars fictional universe.", "Blue, white", "3", "90 miles", "534 million miles", "38 days", "Hoth is home to only a few species, including the towering, predatory Wampa and the gray snow-lizards known as Tauntauns.")

end
