# Kirsten Schumy
# Ada[9], Ampers
# Week 1: SolarSystem Assignment
# February 12, 2018
#
# This program creates a solar system of dwarf planets and allows the user to
# explore the planets and add a new planet.

# =================================== Planet ===================================
# This program creates a new Planet, provides the planet's information, and
# compares the distance between the planet and another planet.
#
class Planet
  attr_reader :name, :location, :year_length, :distance_from_the_sun, :diameter,
    :mass, :number_of_moons

  # Pre: provided initial_name and initial_location must be non-empty Strings,
  # initial_year must be the an float and represent the number of planet years
  # are equal to one Earth year, initial_distance_from_sun must be an int and
  # represent how many km the planet is (on average) from the Sun,
  # initial_diameter must be an int and represent the planet's diameter in km,
  # initial_mass must be a float and represent the plant's mass in kg, and
  # initial_number_of_moons must be an int and represent the number of moons the
  # planet has. All int and float values must be greater than zero, except for
  # initial_number_of_moons which may be zero.
  def initialize(initial_name, initial_location, initial_distance_from_the_sun,
     initial_year, initial_diameter, initial_mass, initial_number_of_moons)
    @name = initial_name
    @location = initial_location
    @distance_from_the_sun = initial_distance_from_the_sun
    @year_length = initial_year
    @diameter = initial_diameter
    @mass = initial_mass
    @number_of_moons = initial_number_of_moons
  end

  # Returns the planet summary.
  def get_summary
    return build_summary
  end

  # If provided other_planet is a planet, returns the difference in km between
  # this planet and other_planet, with negative numbers indicating that this
  # planet is closer to the sun than other_planet, positive values
  # indicating that other_planet is closer to the sun than this planet, and zero
  # indicating they are equal distances from the sun.
  # Returns 'nil' if other_planet is not a planet.
  def compare_to_distance(other)
    return compare_to_distance_helper(other) if other.class == Planet
  end

  private

  # Returns the planet summary.
  def build_summary
    return "#{@name.upcase}
      🌌 Location: #{@location}
      ☀️  Distance from Sun: #{get_readable_number(@distance_from_the_sun)} km
      🗓  Length of year: #{get_readable_number(@year_length)} years
      📏 Diameter: #{get_readable_number(@diameter)} km
      ⚖️  Mass: #{get_readable_number(@mass)} kg
      🌘 Number of Moons: #{@number_of_moons}"
  end

  # Returns this planet's distance_from_the_sun minus the provided other
  # planet's distance_from_the_sun.
  def compare_to_distance_helper(other)
    return @distance_from_the_sun - other.distance_from_the_sun
  end

  # Returns a more readable version of provided number depending on if number is
  # a scientific number or a number over 1,000.
  def get_readable_number(number)
    return number.to_s.include?("e+") ? get_scientific_notation(number) :
      get_large_number(number)
  end

  # If provided number is > 1,000, returns number as String with commas in the
  # correct position; otherwise, returns number.
  def get_large_number(number)
    return number if number < 1000
    number = number.to_s
    # Subtracts by 3 to start comma at thousand's position
    start_index = (number.include?(".") ? number.index(".") : number.length) - 3
    index_count = 0
    start_index.downto(1) do |index|
      number.insert(index, ",") if index_count % 3 == 0
      index_count -= 1
    end
    return number
  end

  # If provided number contains 'e+', returns number as a String with 'e+'
  # replaced by ' × 10^'.
  def get_scientific_notation(number)
    return number.to_s.gsub("e+", " × 10^")
  end

end

# ================================ SolarSystem =================================
# This program creates a solar system of planets. This program also add
# additional planets, returns a known planet, gets a list of the planets,
# informs if a planet is a known planet, return the number of known planets,
# gets the local year of a known planet, and set the age of the solar system.
#
class SolarSystem
  attr_reader :age

  # Provided initial_planets must be an Array of Planets.
  # Returns a new SolarSystem with each planet from provided initial_planets.
  def initialize(initial_planets)
    @planets = []
    @age = 0
    add_initial_planets(initial_planets)
  end

  # Adds provided new_planet to the solar system if new_planet is a planet.
  def add_planet(new_planet)
    add_new_planet(new_planet) if new_planet.class == Planet
  end

  # Pre: provided planet_name must be a String; otherwise, return 'nil'.
  #
  # Returns the planet with provided planet_name if planet_name is the name of
  # a planet in the solar system.
  def get_planet(planet_name)
    return get_planet_if_known(planet_name) if planet_name.class == String
  end

  # Returns the names of the planets.
  def list_planets
    return get_planets_list_as_string
  end

  # Returns 'true' if provided planet_name is a String and is the name of a
  # known planet. Otherwise, returns 'false'.
  def has_planet?(planet_name)
    return !get_planet(planet_name).nil?
  end

  # Returns the number of planets.
  def number_of_planets
    return get_size
  end

  # Returns the local year of provided planet_name if planet_name is the name of
  # a planet in the solar system. Otherwise, returns 'null'.
  def local_year_of_planet(planet_name)
    return calculate_local_year(planet_name) if has_planet?(planet_name)
  end

  # Sets solar system age to provided possible_age if possible_age greater than
  # or equal to 0.
  def set_age(possible_age)
    @age = possible_age if possible_age >= 0
  end

  private

  # Pre: throws ArgumentError if provided initial_planets is not an Array.
  def has_initial_array_or_error(initial_planets)
    if initial_planets.class != Array
      raise ArgumentError.new("#{initial_planets} must be an Array.")
    end
  end

  # Returns the number of planets.
  def get_size
    return @planets.size
  end

  # Pre: throws ArgumentError if provided initial_planets is not an Array.
  #
  # Populates solar system with each valid Planet in provided initial_planets.
  def add_initial_planets(initial_planets)
    has_initial_array_or_error(initial_planets)
    initial_planets.each { |planet| add_planet(planet) }
  end

  # Adds new planet if the planet's name does not match (case-insensitive) one
  # of the known planets.
  def add_new_planet(new_planet)
    @planets.push(new_planet) if !has_planet?(new_planet.name)
  end

  # Returns the list of planets.
  def get_planets_list_as_string
    planets_string = ""
    (1..number_of_planets).each do |num|
      planets_string = "#{planets_string}\n  #{num}.  #{@planets[num - 1].name}"
    end
    return planets_string
  end

  # If provided planet_name is a name of a known planet, returns the planet.
  # Otherwise returns 'nil'.
  def get_planet_if_known(planet_name)
    return @planets.find { |planet| planet.name.casecmp?(planet_name) }
  end

  # Returns the local year of provided planet_name.
  def calculate_local_year(planet_name)
    return @age / get_planet_if_known(planet_name).year
  end

end

# ================================== client ====================================

# Prints instructions for user to select planet to get information.
def print_instructions
  puts "\nThe Dwarf Planets!\n\n"
  puts "There's so many interesting things about the dwarf plants!"
  puts "Enter a dwarf planet's name to learn more about it or enter"
  puts "'add' to add a new planet or 'exit' to quit."
end

# Returns the planets and the other options available to user.
def get_selection_options(dwarf_planets)
  return "\nPLANETS#{dwarf_planets.list_planets}
  #{dwarf_planets.number_of_planets + 1}.  ADD
  #{dwarf_planets.number_of_planets + 2}.  EXIT\n"
end

# Prompts the user for a planet name or command. Exits the program if the user
# enters 'exit'. Otherwise, returns the user's input.
def prompt_and_get_planet_name
  print "\nWhat planet do you want to learn more about? > "
  planet_name = gets.chomp.strip
  planet_name.downcase == "exit" ? exit : (return planet_name)
end

# Prints massage about not being able to find provided name and asks user if the
# user would like to add name as a new planet until the user responds 'y' or
# 'n'. Returns 'true' is the user entered 'y'. Otherwise, returns 'false'.
def add_new_planet?(name)
  puts "Hmmm I can't find the #{name.inspect}."
  loop do
    print "Do you want to add #{name.inspect} as a new dwarf planet? (Y/N)> "
    y_or_n =  gets.chomp.downcase
    return y_or_n == "y" if y_or_n == "y" || y_or_n == "n"
    puts "Invalid response #{y_or_n.inspect}"
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - start of getting planet info

# Returns distance_in_km value in astronomical units (AU).
def convert_km_to_au(distance_in_km)
  return distance_in_km / 150_000_000
end

# Prints the provided start_char, a dash for each astronomical units (AU) of the
# provided distance_in_km, and prints the end_char.
def spaceship_journey(distance_in_km, start_char, end_char)
  distance_in_au = convert_km_to_au(distance_in_km)
  print "#{start_char}"
  distance_in_au.times do
    print "➖"
    sleep(0.1)
  end
  puts "#{end_char}🌐"
end

# Calls a simulation of a trip from provided current_planet to provided
# next_planet.
def set_up_space_journey(next_planet, current_planet)
  start_planet_emoji = current_planet.name == "Earth" ? "🌎" : "🌐"
  distance_to_travel = current_planet.compare_to_distance(next_planet)
  if distance_to_travel > 0
    spaceship_journey(distance_to_travel, "#{start_planet_emoji}🚀", "")
  else
    spaceship_journey(distance_to_travel * -1, "#{start_planet_emoji}", "🚀")
  end
end

# Prints a simulation of a trip from provided current_planet to provided
# next_planet and prints the summary.
def print_planet_info(next_planet, current_planet)
  if next_planet != current_planet
    puts "\nBlasting off to #{next_planet.name}!"
    set_up_space_journey(next_planet, current_planet)
  end
  puts next_planet.get_summary
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - end of getting planet info
# - - - - - - - - - - - - - - - - - - - - - - start of adding new planet section

# Returns 'true' if provided possible_name is 'add', 'exit', or 'earth'
def invalid_name?(possible_name)
  return possible_name.downcase == "add" || possible_name.downcase == "exit" ||
    possible_name.downcase == "earth"
end

# Prompts user to enter an input for provided new_attribute until the user has
# entered a word or words at least one non-empty character in length. Returns
# word or words.
def get_string_attribute(new_attribute)
  loop  do
    print "Please provide a #{new_attribute}: "
    new_attribute_value = gets.chomp.strip
    # program does not allow name to be "add" or "exit" (case insensitive), as
    # these would break the program
    redo if invalid_name?(new_attribute_value) if new_attribute == "name"
    return new_attribute_value if new_attribute_value.length > 0
    puts "The #{new_attribute} must have at least one character.\n"
  end
end

# Prompts user to enter an input for provided new_attribute until the user has
# entered a number value greater than or equal to 0.0. Returns value.
def get_float_attribute(new_attribute)
  loop  do
    print "Please provide a #{new_attribute} ≥ 0.0: "
    new_attribute_value = gets.chomp.to_f
    return new_attribute_value if new_attribute_value > 0.0
    puts "The #{new_attribute} must be at least 0.0.\n"
  end
end

# Prompts user to enter an input for provided new_attribute until the user has
# entered a number value greater than or equal to provided min. Returns value.
def get_int_attribute(new_attribute, min)
  loop  do
    print "Please provide a #{new_attribute} ≥ #{min}: "
    new_attribute_value = gets.chomp.to_i
    return new_attribute_value if new_attribute_value >= min
    puts "The #{new_attribute} must be at least #{min}.\n"
  end
end

# Prompts the user for information for a new planet.
def get_new_planet
  get_new_named_planet("")
end

# Prompts the user for information for new planet with provided name, if name
# is a non-empty string.
def get_new_named_planet(name)
  name = nil if name.strip.length < 1 || invalid_name?(name)
  new_planet_info = [
    # sets planet_name to name if name contains at least one character
    !name.nil? ? name.strip : get_string_attribute("name"),
    get_string_attribute("location"), # initial_location
    get_int_attribute("distance from Sun in km", 0), # initial_distance_from_sun
    get_float_attribute("year length"), # initial_year
    get_int_attribute("diameter", 1), # initial_diameter
    get_float_attribute("mass in kg"), # initial_mass
    get_int_attribute("number of moons", 0) # initial_number_of_moons
  ]
  return Planet.new(*new_planet_info)
end

# - - - - - - - - - - - - - - - - - - - - - - - end of adding new planet section

# ------------------------------------------------------------------ client main

list_of_dwarf_planets = [
  Planet.new("Ceres", "Asteroid belt", 413_700_000, 4.60, 945, 9.39e+20, 0),
  Planet.new("Pluto", "Kuiper belt", 5_906_380_000, 248.09, 2377, 1.309e+22, 5),
  Planet.new("Haumea", "Kuiper belt", 6_432_011_461, 283.28, 1632, 4.01e+21, 2),
  Planet.new("Makemake", "Kuiper belt", 6_847_000_000, 309.9, 175, 3.5e+21, 1),
  Planet.new("Eris", "Scattered disc", 10_125_000_000, 557.4, 2326, 1.66e+22, 1)
]
dwarf_planets = SolarSystem.new(list_of_dwarf_planets)
dwarf_planets.set_age(5_400_000_000)

earth = Planet.new("Earth", "Inner", 150_000_000, 1, 12_742, 5.972e+24, 1)

# current_planet stores the planet the user is currently on and is used as a
# reference when printing the user's rocket journey
current_planet = earth

print_instructions

# Until user enters 'exit', prompts user to selected a planet to learn more
# about or to add a planet.
loop do
  puts  get_selection_options(dwarf_planets) # prints options
  planet_name = prompt_and_get_planet_name  # program exits if user enters 'exit'
  if planet_name.downcase == "add"
    dwarf_planets.add_planet(get_new_planet)
  elsif !dwarf_planets.has_planet?(planet_name) # if not a known planet
    redo if !add_new_planet?(planet_name) # if user does not want to add planet
    dwarf_planets.add_planet(get_new_named_planet(planet_name)) # adds planet
  else  # known planet
    next_planet = dwarf_planets.get_planet(planet_name)
    print_planet_info(next_planet, current_planet)
    current_planet = next_planet
  end
end
