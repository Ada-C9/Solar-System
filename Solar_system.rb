class SolarSystem

  def initialize(all_planets)
    @planets = all_planets
  end

  attr_accessor :planets

  def planet_list
    planet_names = [ ]
    i = 0
    @planets.each do |planet_name|
      planet_names << "#{i+1}. #{planet_name.name}"
      i += 1
    end
    puts planet_names
  end
end


class Planet

  def initialize(input_name, input_diameter, input_distance_from_sun, input_orbit_period, input_number_of_moons, input_mean_temp)
    @name = input_name
    @diameter = input_diameter
    @distance_from_sun = input_distance_from_sun
    @orbit_period = input_orbit_period
    @moons = input_number_of_moons
    @mean_temp = input_mean_temp
  end

  attr_reader :name, :diameter, :distance_from_sun, :orbit_period, :moons, :mean_temp

  def planet_summary
    puts "\nHere are some fun facts about #{@name}:
    Diameter: #{@diameter}
    Distance from Sun: #{@distance_from_sun} AU
    Orbit Period: #{@orbit_period}
    Number of moons: #{@moons}
    Mean temperature: #{@mean_temp}°C"
  end

end

def add_planet
  puts "\nWe will need you to enter a few facts about your planet:"
  print "Name: "
  new_planet_name = gets.chomp.capitalize
  print "Enter the diameter in km: "
  new_diameter = gets.chomp
  print "Distance from the sun in AU: "
  new_distance_from_sun = gets.chomp.to_f
  print "Orbit period in days: "
  new_orbit = gets.chomp
  print "Number of moons: "
  new_number_of_moons = gets.chomp
  print "Mean temperature in °C: "
  new_mean_temp = gets.chomp
  puts "\nThank you for adding a new planet to our directory!"
  return Planet.new(new_planet_name, new_diameter, new_distance_from_sun, new_orbit, new_number_of_moons, new_mean_temp)
end

objects_of_planets_class = [
  Planet.new("Mercury", "4,879 km", 0.39, "88 days", 0, 167),
  Planet.new("Venus", "12,104 km", 0.73, "225 days", 0, 464),
  Planet.new("Earth", "12,742 km", 1, "365 days", 1, 15),
  Planet.new("Mars", "6,779 km", 1.38, "1.9 years", 2, -65),
  Planet.new("Jupiter", "139,822 km", 5.20, "29.5 years", 67, -110), Planet.new("Hoth", "5,030 km", 7.30, "32 years", 3, -60)
]

explora_solar_system = SolarSystem.new(objects_of_planets_class)

def valid(max)
  selection = gets.chomp.to_i
  until (1..max).include?(selection)
    print "Enter valid choice: "
    selection = gets.chomp.to_i
  end
  return selection
end

# Introduction for user. Informs user that they can view existing planet or add new planet.
puts "\n\n🚀 ✨ 💫  EXPLORA 💫 ✨ 🚀\n\nWelcome to the Solar System of Explora! Learn about any of the existing 6 planets or add your own!\n"

continue = " "
while continue != "n"
  # List of options of what user can do.
  puts "\nHere are your options:\n\n1. Learn about a planet\n2. Create new planet\n3. Exit\n\n"

  # User prompted to enter number of action they want to complete.
  print "Enter the number of your choice: "

  # User will get error if they don't enter a valid choice (1,2 or 3)
  selection = valid(3)
  if selection == 1
    puts "\nThese are the current planets in our Solar System:\n"
    # If user selects learn more about a planet a list of current planets in solar system are printed
    explora_solar_system.planet_list

    # Prompt user to enter name of planet to view, or add a new planet
    print "\nEnter the number corresponding to the planet you would like to learn more about: "

    # User will be asked to enter valid number if it's not within length of planets in solar system array
    planet_selection = valid(objects_of_planets_class.length)
    planet_selection -= 1
    # Summary of planet of choice is printed
    objects_of_planets_class[planet_selection].planet_summary
  elsif selection == 2
    # User prompted to enter new planet information
    new_planet = add_planet
    objects_of_planets_class.push(new_planet)
  else selection == 3
    # Program will exit if user selects choice 3 'exit'
    exit
  end

  # User is asked if they want to continue using program. If yes, the options of actions are listed again.
  print "\nWould you like to continue using Explora (y/n): "
  continue = gets.chomp.downcase
  valid_continue_options = ["y", "n"]
  until valid_continue_options.include? continue
    print "Enter if you want to continue (y or n): "
    continue = gets.chomp.downcase
  end

end
