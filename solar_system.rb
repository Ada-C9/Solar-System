# SolarSystem class includes methods for instantiating the system,
# returning an array or list of names of existing planets in the system,
# and adding a new planet.
class SolarSystem
  def initialize(planets)
    @planets = planets
  end

  attr_reader :planets

  # returns array of planet names
  def names
    planet_names = []
    @planets.each do |planet|
      planet_names << planet.name
    end
    return planet_names
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  # returns ordered list of planet names
  def planet_list
    list = ""
    @planets.each_with_index do |planet, i|
      list += "  #{i+1}. #{planet.name}\n"
    end
    return list
  end
end

# Planet class includes methods for instantiating a planet and
# and returning details about a planet.
class Planet
  def initialize(name, diameter, distance_from_sun, year_length, moons)
    @name = name
    @diameter = diameter
    @distance_from_sun = distance_from_sun
    @year_length = year_length
    @moons = moons
  end

  attr_reader :name, :diameter, :distance_from_sun, :year_length, :moons

  def details
    details = "  Planet name: #{@name}\n  Diameter: #{@diameter} miles\n  Distance from the sun: #{@distance_from_sun} millions of miles\n  Year length: #{@year_length} Earth days\n  Moons: #{@moons}"
    return details
  end
end

# Provides user with menu options for seeing details about a planet, adding or deleting a planet, or exiting the program.
def provide_options
  puts "\nWould you like to:"
  puts "  A. See some information about a particular planet"
  puts "  B. Add a new planet to the system"
  puts "  C. Delete a planet from the system"
  puts "  D. Exit the program"
  print "\nEnter your selection (A, B, C, or D): "
  return selection = gets.chomp.upcase
end

# Validates user input from the menu options. Repeats query if input != A, B, C, or D
def validate_letter_selection(input)
  until ["A", "B", "C", "D"].include?(input)
    print "That doesn't look like one of the options. \n\nPlease enter either A, B, C, or D: "
    input = gets.chomp.upcase
  end
  return input
end

# Validates user input from planet selections.
# Repeats query if input is either != a planet name in the existing system,
# or the number of a planet in the corresponding list of planets.
def validate_planet_selection(input, names, length)
  until names.include?(input) || (1..length).include?(input.to_i)
    print "That doesn't look like one of the planets in the system. \n\nPlease select a planet (by name or number) from the existing system: "
    input = gets.chomp.capitalize
  end
  return input
end

# Prompts user to enter details about a new planet. Uses details to create a new instance of Planet.
def define_new_planet
  print "\nWhat is the name of the planet? "
  planet_name = gets.chomp.capitalize
  print "What is the diameter of #{planet_name} (in miles)? "
  planet_diameter = gets.chomp.to_i
  print "What is #{planet_name}'s distance from the sun (in millions of miles): "
  planet_distance_from_sun = gets.chomp.to_f
  print "What is the #{planet_name}'s year length (in Earth years)? "
  planet_year_length = gets.chomp.to_f
  print "How many moon's does #{planet_name} have? "
  planet_moons = gets.chomp.to_i
  return new_planet = Planet.new(planet_name, planet_diameter, planet_distance_from_sun, planet_year_length, planet_moons)
end

# Creates eight instances of Planet in the initial SolarSystem
planet_a = Planet.new("Mercury", 3031, 36.0, 0.161, 0)
planet_b = Planet.new("Venus", 7521, 67.2, 0.615, 0)
planet_c = Planet.new("Earth", 7926, 93.0, 1.0, 1)
planet_d = Planet.new("Mars", 4217, 141.6, 1.881, 2)
planet_e = Planet.new("Jupiter", 86881, 483.6, 11.862, 67)
planet_f = Planet.new("Saturn", 74900, 886.7, 29.456, 62)
planet_g = Planet.new("Uranus", 31763, 1784.0, 84.07, 27)
planet_h = Planet.new("Neptune", 30775, 2794.4, 164.81, 13)

# Creates an instance of SolarSystem, which includes the eight previously defined planets
my_solar_system = SolarSystem.new ([planet_a, planet_b, planet_c, planet_d, planet_e, planet_f, planet_g, planet_h])

puts "* * * * * WELCOME TO THE SOLAR SYSTEM! * * * * *"

# Continues to prompt user with menu until there are no more planets in the system (or program is exited via option D)
until my_solar_system.names.empty?

  # Prompts user with menu options, validates the input, and stores it in variable selection
  selection = validate_letter_selection(provide_options)

  # Case statement tests selection against conditions A, B, C, and D
  case selection
  # If A is selected, prompts user for planet from a provided list of existing planets in the system
  # Validates planet selection and prints details about the planet
  # If/else statement used to differentiate between user input as the name or list number of a planet
  when "A"
    puts "\nWhich planet would you like to see information about?"
    puts my_solar_system.planet_list
    print "\nPlease select a planet (by name or number): "
    planet_selection = validate_planet_selection(gets.chomp.capitalize, my_solar_system.names, my_solar_system.names.length)
    if my_solar_system.names.include?(planet_selection)
      my_solar_system.planets.each do |planet|
        puts planet.details if planet.name == planet_selection
      end
    else
      my_solar_system.planets.each_with_index do |planet, i|
        puts planet.details if planet_selection.to_i == i+1
      end
    end
  # If B is selected, prompts user to provide details about the new planet,
  # creates a new instance of planet, and adds the planet to the system.
  # Prints list of planets in the system including the newly added planet
  when "B"
    my_solar_system.add_planet(define_new_planet)
    puts "\n#{my_solar_system.names[-1]} has been added to the system:"
    puts my_solar_system.planet_list
  # If C is selected, prompts user to select a planet to be deleted from the list
  # Validates planet selection and deletes the planet from the system
  # First if/else statement used to differentiate between user input as the name or list number of a planet
  # Second if/else statements determines if user has deleted the last planet in the system, and if so, exits the program,
  # otherwise prints new list of planets with deleted planet omitted
  when "C"
    puts "\nWhich planet would you like to delete from the system?"
    puts my_solar_system.planet_list
    print "\nPlease select a planet to delete (by name or number): "
    planet_deletion = validate_planet_selection(gets.chomp.capitalize, my_solar_system.names, my_solar_system.names.length)
    if my_solar_system.names.include?(planet_deletion)
      my_solar_system.planets.delete_if do |planet|
        planet_deletion == planet.name
      end
    else
      my_solar_system.planets.delete_at(planet_deletion.to_i-1)
    end
    if my_solar_system.names.empty?
      puts "\nYou've deleted all the planets and the system no longer exists! Goodbye."
      exit
    else
      puts "\nExisting planets in the system now include: "
      puts my_solar_system.planet_list
    end
  # If D is selected, exits the program
  when "D"
    puts "Goodbye."
    exit
  end
end
