# Wave 1
# The learning goal for this wave is to work on building a single class.
#
# Primary Requirements

# Instead of Strings for planets, modify SolarSystem's initialize method
#to take a list of hashes where each planet is sent as a hash with at
#least 5 attributes. For example, your code could now look like this:

mercury = {
  name: "Mercury",
  moons: 0,
  diameter_km: 4.879,
  orbitperiod_days: 88,
  temp_c: - 173,
}
venus = {
  name: "Venus",
  moons: 0,
  orbitperiod_days: 224.7,
  temp_c: 462,
}
earth = {
  name: "Earth",
  moons: 1,
  orbitperiod_days: 365.2,
  temp_c:[-88,58],
}
mars = {
  name: "Mars",
  moons: 2,
  orbitperiod_year: 1.9,
  temp_c: -63
}
jupither = {
  name: "Jupither",
  moons: 67,
  orbitperiod_year: 11.9,
  temp_c: -139,
}
hoth = {
  name: "Hoth",
  moons: 1000,
  orbitperiod_year: 23,
  temp_c: 21,
}

allplanets = [venus, jupither, earth, hoth, mercury, mars]

# Create a SolarSystem class with an @planets instance variable.
class SolarSystem
  # Create an initialize method which should take a collection of planet
  #names and store them in an @planets instance variable.
  attr_accessor :planets
  def initialize(planetsdata)
    @planets = planetsdata
  end

  def matchplanet
    @planets.each do |planeta|
      if planeta.name == askedplanet
        puts planeta.easytoread
      end
    end
  end
  # Create a method that adds a planet to the list (not using user input).
  def addplanet=(new_planet)
    @planet = new_planet
    @planets << @planet
  end
  # Create a method which will return, not print,
  #a list of the planets as a String
  def printallplanets
    i = 1
    planetlist = ""
    @planets.each do |planeta|
      planetlist = planetlist +  "#{i}. #{planeta.name}\n"
      i = i + 1
    end
    return planetlist
  end
end

# Write code to test your SolarSystem
my_ss = SolarSystem.new(allplanets)
#my_ss.newplanet = ({name: "Saturn", moons: 5 , orbitperiod_days: 200, temp_c: 200})d

#################################################################
#WAVE 2
# The learning goal for this wave is to work on building multiple classes, and composing these classes together.
#
# Primary Requirements
# Create a Planet class which will represent a planet.
# Add an initialize method which takes several arguments and uses
#them to set the class' instance variables.
class Planet
  # Create reader methods to give a user access to read the instance variables.
  attr_accessor :name, :moons, :orbitperiod_days, :temp_c
  def initialize (planethash)
    @name = planethash[:name]
    @moons = planethash[:moons]
    @diameter = planethash[:diameter]
    @orbit = planethash[:orbitperiod_days]
    @temp = planethash[:temp_c]
  end
  # Create a method that returns the Planet's attributes in an easy to read fashion.
  def easytoread
    return "#{@name.upcase}\n - Moons: #{@moons}\n - Diameter #{@diameter}\n - Days to orbit : #{@orbit}\n - Temperature: #{@temp}ºC"
  end
end
#################################################################
# Make your SolarSystem class take an array of Planets instead of hashes.
planetmercury = Planet.new(mercury)
planetvenus = Planet.new(venus)
planetearth = Planet.new(earth)
planetmars = Planet.new(mars)
planetjupither = Planet.new(jupither)
planethhoth = Planet.new(hoth)

planets = [planetmercury, planetvenus, planetearth, planetmars, planetjupither, planethhoth]

my_solarsystem = SolarSystem.new(planets)


#puts planetmars.easytoread
#puts "---------------"
#puts my_solarsystem.printallplanets
#puts "---------------"
###############################################################
#new planet to my SolarSystem
saturn = {
  name: "Saturn",
  moons: 3,
  diameter_km: 7483,
  orbitperiod_days: 67,
  temp_c: - 50,
}

planetsaturn = Planet.new(saturn)

#one way to add my new planet to my ss
#planets << planetsaturn
################################################################
# Wave 3
#################################################################
puts "-----------------------------------------------------"
puts "-----------------------------------------------------"
puts "S O L A R   S Y S T E M   P R O G R A M"
puts "-----------------------------------------------------"
puts "-----------------------------------------------------"
puts "Hello new visitor! Welcome to the SolarSystem Program experience."
puts "-----------------------------------------------------"
puts "Our Solar System has #{planets.length} planets which are:"
puts my_solarsystem.printallplanets
puts "-----------------------------------------------------"
# Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.
# Allow your user to add their own planet.

newplanet = {}
puts "You might think that we are missing a planet, or maybe you would like to create a new one, in either case:"
puts "Do you want to add/create a new planet?"
answer = gets.chomp.to_s.upcase
while answer == "YES"
  puts "What is the name of your new planet?"
  newplanet[:name] = gets.chomp.to_s
  puts "How many moons does it have?"
  newplanet[:moons] = gets.chomp
  puts "and the diameter?"
  newplanet[:diameter] = gets.chomp
  puts "please tell me how many days it takes to orbit?"
  newplanet[:orbitperiod_days] = gets.chomp
  puts "and last, what about the temperture?"
  newplanet[:temp_c] = gets.chomp
  #newplanet added by user is pushed to become a Planet and become part of the SolarSystem
  planetnew = Planet.new(newplanet)
  my_solarsystem.addplanet = planetnew
  puts "-----------------------------------------------------"
  puts "\n We have added another planet to our list! Here it is:"
  puts planetnew.easytoread
  puts "-----------------------------------------------------"
  puts "Would you like to create another planet?"
  answer = gets.chomp.to_s.upcase
end
puts "-----------------------------------------------------"
puts "\n \n Now that we have all the planets we want to have:
#{my_solarsystem.printallplanets}\n "

again = "yes"

while again == "yes"
  puts "Tell me the name of the planet
  you would like to know more about:"
  askedplanet = gets.chomp.to_s.downcase
  puts "-----------------------------------------------------"
  # When printing the planet list or planet details, it should call the corresponding method in Planet.

  my_solarsystem.planets.each do |planeta|
    if planeta.name.downcase == askedplanet
      puts planeta.easytoread
    end
  end
  puts "-----------------------------------------------------"
  puts "Do you want to know about another planet?"
  again = gets.chomp.to_s.downcase
end
puts "-----------------------------------------------------"
puts "-----------------------------------------------------"
puts "We hope you enjoyed your SolarSystem experience, see you soon!!! :)"
puts "-----------------------------------------------------"
puts "-----------------------------------------------------"
