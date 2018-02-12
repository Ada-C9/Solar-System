# Maria I Velez - Octos - C9
# 12 Feb 2018
# Solar System program
# https://github.com/Ada-C9/Solar-System

### WAVE 3

# Create a SolarSystem class with an @planets instance variable.
class SolarSystem
  # Create an initialize method which should take a collection of planet names and store them in an @planets instance variable.
  def initialize(all_planets)
    @planets = all_planets
  end

  attr_accessor :planets

  # Create a method that adds a planet to the list (not using user input)
  def planets
    return @planets
  end

  # Create a method which will return, not print, a list of the planets as a String in this style
  def summary
    counter = 0
    temp_list = []
    @planets.each do | planet |
      counter += 1
      temp_list.push("#{counter}. #{planet.name}")
    #   puts "#{planet[:name]}"  <-- this is what I used for Wave 1
    puts "#{counter}. #{planet.name}"
    end
    return temp_list

  end
end

# Create a Planet class which will represent a planet
class Planet

    attr_reader :name, :mass, :color_from_afar, :equatorial_radius, :surface, :number_of_moons, :distance_from_the_sun

# Add an initialize method which takes several arguments and uses them to set the class' instance variables
  def initialize(name, mass, color_from_afar, equatorial_radius, surface, number_of_moons, distance_from_the_sun) # <-arguments or parameters go here
    @name = name
    @mass = mass
    @color_from_afar = color_from_afar
    @equatorial_radius = equatorial_radius
    @surface = surface
    @number_of_moons = number_of_moons
    @distance_from_the_sun = distance_from_the_sun

  end

# Create a method that returns the Planet's attributes in an easy to read fashion.
  def attributes
    return "\n\tPlanet Name: #{@name}\n\tMass: #{@mass}\n\tColor from Afar: #{@color_from_afar}\n\tEquatorial Radius: #{@equatorial_radius}\n\tSurface Topography: #{@surface}  \n\tNumber of Moons: #{@number_of_moons}\n\tDistance from the Sun: #{@distance_from_the_sun}"
  end

end

# Instances of each planet
mercury = Planet.new("Mercury", "3.3011 × 10^23 kg", "gray with white speckles", "2,439.7 km", "heavily cratered", "none", "46 to 70 million km")

venus = Planet.new("Venus", "4.8675 × 10^24 kg", "mostly orange", "6,052 km", "volcanic", "none", "average 108.2 million km")

earth = Planet.new("Earth", "5.97237 × 10^24 kg", "blue green", "6378.1 km", "mostly water", "1", "average 149.6 million km")

mars = Planet.new("Mars", "6.4171 × 10^23 kg", "reddish", "3396.2 ± 0.1 km", "dry and dusty", "2", "average 230 million km")

jupiter = Planet.new("Jupiter", "1.8982 × 10^27 kg", "marbled", "71,492 km", "not solid, mostly hydrogen and helium gas", "69", "average 75 million km")

uranus = Planet.new("Uranus", "8.6810±0.0013 × 10^25 kg", "icy blue", "25,559±4 km", "featureless", "27", "about 3 billion km")

planet_list = [mercury, venus, earth, mars, jupiter, uranus]

my_solar_system = SolarSystem.new(planet_list)

# Method on its own, outside of a class, to check if what the user enters is one of the choices available
def check_if_user_input_is_a_planet_choice(user_input, planet_list)
  if user_input == "quit"
    puts "Goodbye! Thanks for playing!"
    return
  end
  info_about_a_planet = ""
  planet_list.each_with_index do | planet, i |
    if user_input == planet.name.downcase || user_input.to_i == i+1
      # when the user_input matches planet
      info_about_a_planet = planet.attributes
      puts info_about_a_planet
    end
  end
  if info_about_a_planet == "" # <- this means we didn't assign any value to info_about_a_planet
    puts "Oops we couldn't find that planet. Try again."
  else
    puts "\nIf you want to learn about another planet, let me know which.\nIf not, type \'quit\' to stop the program."
  end

end

# This is the first message the user will see
puts "Welcome to the a simple virtual model of the Solar System.\n Please enter \'r\' if you want to *read* about a planet\n or \'m\' if you want to *make* a new planet."
first_decision = gets.chomp.downcase

if first_decision == "r"
  # if user wants to *read* about an existing planet by typing in "r", then check if the user input matches one of the available planets
  puts "\nYou are now inside the planetary selector...\nPlease choose by entering the name of a planet or its corresponding number:"
  # this will show the user the list of available planets
  my_solar_system.summary
  user_input = gets.chomp.downcase

  check_if_user_input_is_a_planet_choice(user_input, planet_list)

  # ask the user what planet they want to learn about
  until user_input == "quit"
    user_input = gets.chomp.downcase
    check_if_user_input_is_a_planet_choice(user_input, planet_list)
  end

# if the user wants to *make* their own planet by typing in "m", then prompt them to enter info about that new_planet
else first_decision == "m"
  puts "What would you like your new planet to be called? "
  new_name = gets.chomp
  puts "What's the mass of your new planet? "
  new_mass = gets.chomp
  puts "What color is it from afar? "
  new_color_from_afar = gets.chomp
  puts "What's your planet's equatorial radius? "
  new_equatorial_radius = gets.chomp
  puts "What is your planet's surface like? "
  new_surface = gets.chomp
  puts "How many moons does your planet have? "
  new_number_of_moons = gets.chomp
  puts "How far away is your planet from the sun? "
  new_distance_from_the_sun = gets.chomp

  puts "This is your brand new planet:\n\tName: #{new_name}\n\tMass:#{new_mass}\n\tColor from Afar: #{new_color_from_afar}\n\tEquatorial Radius: #{new_equatorial_radius}\n\tSurface Topography: #{new_surface}\n\tNumber of Moons: #{new_number_of_moons}\n\tDistance from the Sun: #{new_distance_from_the_sun}"

  puts "Would you like to play again? Please enter \'yes\' or \'no\'."
  second_decision = gets.chomp.downcase

  # At this point, let user choose to continue to play with a 'yes' or 'no'
  if second_decision == "y" || second_decision == "yes"
    puts "Choose one of these or \'quit\' to end the program. "
    my_solar_system.summary
    user_input = gets.chomp.downcase

    check_if_user_input_is_a_planet_choice(user_input, planet_list)

    # this option lets user leave the program
    until user_input == "quit"
      user_input = gets.chomp.downcase
      check_if_user_input_is_a_planet_choice(user_input, planet_list)
    end

  elsif second_decision == "n" || second_decision == "no"
    puts "Alright then. Have a nice day!"
  else puts "That wasn't one of the options.\nYou seem to be unable to follow directions.\nGoodbye!"
  end

end
