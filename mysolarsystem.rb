# Define a solar system class
class Solar_System

attr_accessor :planets
def initialize(planets)
 @planets = planets
end

def summary
 return @planets
end

end

planetjermaine = {
  name: "Jermaine",
  color: "blue",
  vibration: "Bass Guitar",
  rings: 1, size: "Biggest"
}
planetjackie = {
  name: "Jackie",
  color: "red",
  vibration: "Tambourine",
  rings: 8,
  size: "Big"
}
planettito = {
  name: "Tito",
  color: "orange",
  vibration: "Lead Guitar",
  rings: 3,
  size: "Medium"
}
planetmarlon = {
  name: "Marlon",
  color: "purple",
  vibration: "Tambourine",
  rings: 4,
  size: "Small"
}
planetmichael = {
  name: "Michael",
  color: "yellow",
  vibration: "Conga",
  rings: 1,
  size: "Very Small"
}

planet_array =[planetjermaine, planetjackie, planettito, planetmarlon, planetmichael]
our_solar_system = Solar_System.new(planet_array)

x = 1
planet_array.each do |variable|
  puts "#{x}. Planet #{variable[:name]} "
  x += 1
  end
