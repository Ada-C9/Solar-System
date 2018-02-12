class SolarSystem
  def initialize(planet_array, name) # use .new to call this method
    @planets = planet_array #array that holds instances of Planet
    @system_name = name
  end

  def system_name
    @system_name
  end

  def add_planet(planet)
    @planets << planet #shovels into array of Planet objects
  end

  def new_planet
    puts "Planet name?"
    name1 = gets.chomp
    puts "Planet diameter in kilometers (km)?"
    diameter1 = gets.chomp
    puts "Planet distance from sun in kilometers (km)?"
    distance1 = gets.chomp
    puts "Planet orbital period in days?"
    orbital_period1 = gets.chomp
    name1 = Planet.new(name1, diameter1, distance1, orbital_period1)
    add_planet(name1) #invoking SolarSystem method
    puts "Your #{name1.summary}"
  end

  def planet_list
    counter = 0
    list = ""
    @planets.each do |planet|
      counter += 1
      list += "#{counter}. #{planet.name} \n"
    end
    return list
  end
end

class Planet # this is ONE planet
  # attr_reader allows you to reference attribut outside of class
  attr_reader :name, :diameter, :distance, :orbital_period

  def initialize(name, diameter, distance, orbital_period)
    @name = name
    @diameter = diameter
    @distance = distance
    @orbital_period = orbital_period
  end

  def summary
    return "Planet Information~\n" +
    "Name: #{name}\n" +
    "Diameter: #{diameter} km\n" +
    "Distance from the Sun: #{distance} km\n" +
    "Orbital Period: #{orbital_period} days\n"
  end
end

mercury = Planet.new("Mercury", 4879, 57909227, 88)
venus = Planet.new("Venus", 12104, 108209475, 225)
earth = Planet.new("Earth", 12742, 149598262, 365)
mars = Planet.new("Mars", 6779, 227943824, 694)
jupiter = Planet.new("Jupiter", 139822, 778340821, 4344)
hoth = Planet.new("Hoth", 4879, 57909227, 549)
saturn = Planet.new("Saturn", 116464, 1426666422, 10768)

planets = [mercury, venus, earth, mars, jupiter, hoth, saturn]

milky = SolarSystem.new(planets, "Milky")

puts "Welcome to the #{milky.system_name} Solar System\n" +
"Our system includes the following planets:"
puts milky.planet_list

planet_selection = "" #global variable? available everywhere?

puts "Would you like to create your own planet and add it to" +
"the #{milky.system_name} Solar System (Y/N)?"

answer = gets.chomp.to_s.capitalize

if answer == "Y"
  milky.new_planet
elsif answer == "N"
  puts "Got it. Select a planet to view more information."
  planet_selection = gets.chomp.to_s
  until ["1", "2", "3", "4", "5", "6", "7", "8"].include?(planet_selection)
    puts "Please enter planet number."
    planet_selection = gets.chomp.to_s
  end
else
  puts "Thank you for viewing our Solar System. Goodbye."
end

case planet_selection
  when "1"
    puts mercury.summary
  when "2"
    puts venus.summary
  when "3"
    puts earth.summary
  when "4"
    puts mars.summary
  when "5"
    puts jupiter.summary
  when "6"
    puts hoth.summary
  when "7"
    puts saturn.summary
  when "8"
    puts milky.last.summary
  else
    puts "You did not enter a valid planet number. Goodbye."
end
