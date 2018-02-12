# decoration to break up solar system program
def decoration
  print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
end

class Planet
  # wave 2: helper method to enable user access to read all attributes of a planet
  attr_reader :name, :moons, :year_length, :distance_from_sun, :mass, :diameter, :diety

  # wave 2: constructor to require certain data for the creation of a new Planet object
  def initialize(planet_attributes)
    @name = planet_attributes[:name]
    @moons = planet_attributes[:moons]
    @year_length = planet_attributes[:year_length] # wave 1 enhancement
    @distance_from_sun = planet_attributes[:distance_from_sun] # also wave 1 extra
    @mass = planet_attributes[:mass]
    @diameter = planet_attributes[:diameter]
    @diety = planet_attributes[:diety]
  end

  # method to return a planets organized and formatted attributes without using puts
  def organized_planet_details
    detailed_summary = "Here are your facts about #{name}:"
    detailed_summary << "\nNumber of Moons: #{@moons}\nYear Length: #{@year_length}"
    detailed_summary << "\nDistance from its Star: #{@distance_from_sun} million miles"
    detailed_summary << "\nMass: #{@mass} kg.\nDiameter: #{@diameter} miles."
    detailed_summary << "\nDiety Namesake: #{@diety}"
    detailed_summary << "\nWe hope you learned something new about #{@name}."
    return detailed_summary
  end
end

class SolarSystem
  attr_reader :name, :solar_age
  # wave 1 constructor for solar system
  def initialize(some_planets, name, solar_age)
    @planets = some_planets
    @name = name
    @solar_age = solar_age
  end

  # wave 1 method to allow adding a planet to the solar system
  def add_planet(new_planet)
    @planets << new_planet
  end

  # method to return a list of planets without using puts
  def return_planets
    planet_list = ""
    @planets.each do |planet|
      planet_list << "#{@planets.index(planet) + 1}. #{planet.name} \n"
    end
    return planet_list
  end
  # method for retrieving a specific planet's attributes' details
  def planet_information(some_planet)
    @planets.each do |planet|
      if some_planet.downcase == planet.name.downcase
        return planet.organized_planet_details
      end
    end
  end
end

# method for user interface
def run_solar_system_program(solar_system)
  # method outside of any class that takes user input to create a new planet
  # then add it to the solar system
  def create_planet(solar_system)
    puts "Alright! What is the name of your planet?"
    name = gets.chomp.capitalize
    puts "How many moons does #{name} have?"
    moons = gets.chomp
    puts "How many Earth years does it take to revolve around its star?"
    year_length = gets.chomp
    puts "How far is #{name} from its star in million miles? Please enter a number."
    distance_from_sun = gets.chomp
    puts "How much mass does the planet have in kg?"
    mass = gets.chomp
    puts "What is the diameter measured in miles?"
    diameter = gets.chomp
    puts "Finally, does its name relate to any mythological dieties?"
    diety = gets.chomp
    new_planet = {name: name, moons: moons, year_length: year_length, distance_from_sun: distance_from_sun, mass: mass, diameter: diameter, diety: diety}
    solar_system.add_planet(Planet.new(new_planet))
  end
  # method to select planet then print its attributes
  def planet_choice_and_details(the_solar_system)
    puts "What planet would you like to learn about? Please enter the name."
    puts the_solar_system.return_planets
    planet_name = gets.chomp
    decoration
    puts the_solar_system.planet_information(planet_name)
  end

  # method to confirm user interest to continue
  # and give them opportunity to do another action
  def continue?
    decoration
    puts "Do you want to learn about another planet? y or n?"
    puts "Or would you like to add your own planet? Enter any other key."
    yes_or_no = gets.chomp.downcase
    decoration
    return yes_or_no
  end

  # start of program that introduces the solar system and prompt user
  puts "Welcome to this program about the #{solar_system.name}."
  puts "The #{solar_system.name} is #{solar_system.solar_age} billion Earth years old."
  puts decoration
  puts "Are you ready to learn about some planets? y or n"
  puts "Or would you like to add your own planet? Enter any other key."
  start_learning = gets.chomp.downcase
  decoration
  # loop the determines what the program does:
  # 1. presents list of planets and a chosen planets detailed_summary
  # 2. add a new planet to solar system
  # 3. ends program
  until start_learning == "n"
    if start_learning == "y"
      planet_of_choice = planet_choice_and_details(solar_system)
      start_learning = continue? # calling method to determine next step in program
      decoration
    elsif start_learning != "n"
      create_planet(solar_system)
      start_learning = continue? # calling method again
      decoration
    end
  end
  puts "Bye now, go out and discover the stars."
end


# hashes for all the planet attributes
mercury = {name: "Mercury", moons: "None", year_length: "88 days", distance_from_sun: 36, mass: "3.3 x 10^23", diameter: 3031, diety: "Hermes"}
venus = {name: "Venus", moons: "None", year_length: "225 days", distance_from_sun: 67.2, mass: "4.9 x 10^24", diameter: 7521, diety: "Aphrodite"}
earth = {name: "Earth", moons: 1, year_length: "365 days", distance_from_sun: 93, mass: "6 x 10^24", diameter: 7926, diety: "Gaia"}
mars = {name: "Mars", moons: 2, year_length: "687 days", distance_from_sun: 141.6, mass: "6.4 x 10^23", diameter: 4222, diety: "Ares"}
jupiter = {name: "Jupiter", moons: 53, year_length: "12 years", distance_from_sun: 483.6, mass: "1.9 x 10^27", diameter: 88729, diety: "Zeus"}
saturn = {name: "Saturn", moons: 53, year_length: "30 years", distance_from_sun: 886.7, mass: "5.7 x 10^26", diameter: 74600, diety: "Chronos"}
uranus = {name: "Uranus", moons: 27, year_length: "84 years", distance_from_sun: 1784, mass: "8.86 x 10^25", diamter: 32600, diety: "Uranus"}
neptune = {name:"Neptune", moons: 13, year_length: "165 years", distance_from_sun: 2794.4, mass: "1.02 x 10^26", diameter: 30200, diety: "Poseidon"}
pluto = {name: "Pluto", moons: 5, year_length: "248 years", distance_from_sun: 3674.5, mass: "1.29 x 10^22", diameter: 1413, diety: "Hades"}

# array to create all the planet objects using hashes of attributes
our_planets = [Planet.new(mercury), Planet.new(venus), Planet.new(earth), Planet.new(mars), Planet.new(jupiter), Planet.new(saturn), Planet.new(uranus), Planet.new(neptune), Planet.new(pluto)]
# creating instance of solar system object that uses above array
our_solar_system = SolarSystem.new(our_planets, "Solar System", "4.6")

# calling method for user interface to begin program
run_solar_system_program(our_solar_system)



# tests that code is meeting requirements in waves 1 and 2
# mercury = Planet.new(mercury)
# puts mercury.organized_planet_details
# puts our_solar_system.return_planets
# puts mercury.name
# our_solar_system.add_planet(Planet.new(saturn))
# puts our_solar_system.return_planets
