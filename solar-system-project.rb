require 'colorize'

### START ARRAY OF HASHES WITH BASIC INFO ABT PLANETS ###

basic_planets = [
  {
    name: "mercury",
    position: 1,
    # in km
    radius: 2439.7,
    # in kg
    mass: "3.3011 x 10^23",
    # in m/s^2
    gravity: 3.7,
    #in K
    avg_temp: 340,
    # million mi
    distance_from_sun: 35.98,
  },
  {
    name: "venus",
    position: 2,
    # in km
    radius: 6051.8,
    # in kg
    mass: "4.6023 x 10^8",
    # in m/s^2
    gravity: 8.87,
    #in K
    avg_temp: 737,
    # million mi
    distance_from_sun: 67.24,
  },
  {
    name: "earth",
    position: 3,
    # in km
    radius: 6371.0,
    # in kg
    mass: "5.97237 x 10^24",
    # in m/s^2
    gravity: 9.807,
    #in K
    avg_temp: 288,
    # million mi
    distance_from_sun: 92.96,
  },
  {
    name: "mars",
    position: 4,
    # in km
    radius: 3389.5,
    # in kg
    mass: "6.4171 x 10^23",
    # in m/s^2
    gravity: 3.711,
    #in K
    avg_temp: 210,
    # million mi
    distance_from_sun: 141.6,
  },
  {
    name: "jupiter",
    position: 5,
    # in km
    radius: 69911,
    # in kg
    mass: "1.8982 x 10^27",
    # in m/s^2
    gravity: 24.79,
    #in K
    avg_temp: 165,
    # million mi
    distance_from_sun: 438.8,
  },
  {
    name: "saturn",
    position: 6,
    # in km
    radius: 58232,
    # in kg
    mass: "5.6834 x 10^26",
    # in m/s^2
    gravity: 10.44,
    #in K
    avg_temp: 134,
    # million mi
    distance_from_sun: 888.2,
  },
  {
    name: "uranus",
    position: 7,
    # in km
    radius: 25362,
    # in kg
    mass: "8.6810 x 10^25",
    # in m/s^2
    gravity: 8.69,
    #in K
    avg_temp: 76,
    # million mi
    distance_from_sun: 1.784,
  },
  {
    name: "neptune",
    position: 8,
    # in km
    radius: 24622,
    # in kg
    mass: "1.0243 x 10^26",
    # in m/s^2
    gravity: 11.15,
    #in K
    avg_temp: 72,
    # million mi
    distance_from_sun: 2795,
  }
]

### END ARRAY OF HASHES WITH BASIC INFO ABT PLANETS ###
### START DEFINITION OF SOLAR SYSTEM CLASS ###

# SolarSystem class makes it possible to add another planet, return planets with numbers, and print everything
class SolarSystem

  attr_accessor :planets

  def initialize(planet_instances)
    @planets = planet_instances
  end

  def add_another_planet(user_input)
    @planets << Planet.new(user_input)
  end

  def return_planets_with_numbers
    planets_with_numbers = []
    @planets.each_with_index do |planet, index|
      planets_with_numbers << "#{index + 1}. #{planet.name.capitalize}"
    end
    return planets_with_numbers
  end

  def print_everything
    entire_encyclopedia = []
    @planets.each_with_index do |planet, index|
    entire_encyclopedia << planet.planet_info
    end
    return entire_encyclopedia
  end

end

### END DEFINITION OF SOLAR SYSTEM CLASS ###
### START DEFINITION OF PLANET CLASS ###

# Planet class makes it possible to store information about a planet and print the corresponding details
class Planet

  attr_accessor :name :position, :radius, :mass, :gravity, :avg_temp, :distance_from_sun

  def initialize(facts_about_planet)
    @name = facts_about_planet[:name].capitalize
    @position = facts_about_planet[:position]
    @radius = facts_about_planet[:radius]
    @mass = facts_about_planet[:mass]
    @gravity = facts_about_planet[:gravity]
    @avg_temp = facts_about_planet[:avg_temp]
    @distance_from_sun = facts_about_planet[:distance_from_sun]
  end

  def planet_info
    return "\n💬 Okay, let's learn a little about #{@name}!\n\n".colorize(:light_blue) + "It is located #{@position} spots from the sun which makes it #{@distance_from_sun} million miles away from the sun itself. As a result, it has an average temperature of about #{@avg_temp}K. This translates to #{"%.2f" % (@avg_temp * (9/5) - 459.67)} degrees Farenheit. To get a better idea of what #{@name} looks like, take a moment to consider the fact that it's #{ 2 * @radius} kilometers wide and nearly #{@mass} kilograms in weight. These metrics lead to a surface gravity of #{@gravity} meters per second squared.\n"
  end

end

### END DEFINITION OF PLANET CLASS ###
### START REGULAR FUNCTIONS ###

# used to store instances of the class planet
planet_instances = []
# used to store user input if the name matches a planet already in SolarSystem
planet_desired = []

# ask user if they want to add a planet to the list then request corresponding details
# user_input hash is used to store the details so they can be added to SolarSystem later
def ask_user_to_add_planet(question, planet_instances)
  answer = ask_user_yes_no(question)
  user_input = {}
  if answer == true
    planet_desired = ["place_holder_planet"]
    until answer == false || planet_desired.length == 0
      user_input = {}
      print "\n✏️  Enter the name of the planet: "
      user_input[:name] = gets.chomp.capitalize
      planet_desired = planet_instances.select {|planet| planet.instance_variable_get(:@name) == user_input[:name] }
      if planet_desired.length != 0
        print "\n⚠️  That planet already exists in our encyclopedia."
        planet_desired = planet_desired.clear
        answer = ask_user_yes_no(question)
        if answer == false
          user_input = {}
          break
        end
        planet_desired = ["place_holder_planet"]
        next
      end
      print "✏️  Enter the position: "
      user_input[:position] = gets.chomp.to_i
      print "✏️  Enter the radius: "
      user_input[:radius] = gets.chomp.to_i
      print "✏️  Enter the mass: "
      user_input[:mass] = gets.chomp
      print "✏️  Enter the surface gravity: "
      user_input[:gravity] = gets.chomp.to_i
      print "✏️  Enter the average surface temperature: "
      user_input[:avg_temp] = gets.chomp.to_i
      print "✏️  Enter the distance from the sun: "
      user_input[:distance_from_sun] = gets.chomp.to_i
    end
  end
  return user_input
end

# ask user if they want to edit the details for an already existing planet
# call instance methods on the details so as to update the objects
def ask_user_to_edit(question, planet_instances)
  answer = ask_user_yes_no(question)
  until answer == false
    user_input = {}
    print "\n✏️  Enter the name of the planet: "
    user_input[:name] = gets.chomp.capitalize
    planet_desired = planet_instances.select {|planet| planet.instance_variable_get(:@name) == user_input[:name] }
    if planet_desired.length == 1
      print "✏️  Enter the updated position: "
      user_input[:position] = gets.chomp.to_i
      planet_desired[0].position = user_input[:position]

      print "✏️  Enter the updated radius: "
      user_input[:radius] = gets.chomp.to_i
      planet_desired[0].radius = user_input[:radius]

      print "✏️  Enter the updated mass: "
      user_input[:mass] = gets.chomp
      planet_desired[0].mass = user_input[:mass]

      print "✏️  Enter the updated surface gravity: "
      user_input[:gravity] = gets.chomp.to_i
      planet_desired[0].gravity = user_input[:gravity]

      print "✏️  Enter the updated average surface temperature: "
      user_input[:avg_temp] = gets.chomp.to_i
      planet_desired[0].avg_temp = user_input[:avg_temp]

      print "✏️  Enter the updated distance from the sun: "
      user_input[:distance_from_sun] = gets.chomp.to_i
      planet_desired[0].distance_from_sun = user_input[:distance_from_sun]

    else
      puts "⚠️ Uh? That's not a planet in our encyclopedia.".colorize(:light_yellow)
      answer = ask_user_yes_no(question)
      next
    end
    return user_input
  end
end

# ask user if they want to see all of the planets in the instance of SolarSystem
# print all of the information stored in SolarSystem
def ask_user_print_everything(question, solar_system)
  answer = ask_user_yes_no(question)
  if answer == true
    puts "\nNo problem! Here's our entire encyclopedia.\n\n"
    puts solar_system.print_everything
    return true
  end
end

# ask user if they want to see information about a single planet only
# print details and re-ask question until user is no loner interested
def ask_user_planet_info(first_ask, second_ask, planet_instances)
  answer = ask_user_yes_no(first_ask)
  until answer == false
    if answer == true
      puts "\n❓ What's the name of the planet you want to learn more about?"
      planet_entered = gets.chomp.capitalize
      planet_desired = planet_instances.select {|planet| planet.instance_variable_get(:@name) == planet_entered }
      if planet_desired.length == 0
        print "\n⚠️  Uh? That doesn't look like one of the planets listed above."
      else
       puts "\n#{planet_desired[0].planet_info}"
       answer = ask_user_yes_no(second_ask)
      end
    end
  end
  return true
end

# ask user yes or no questions and require input to conform to the expected yes/no
def ask_user_yes_no(question)
  puts "\n"
  while true
    puts "#{question}"
    answer = gets.chomp
    if answer =~ /^\s*[Yy]([Ee][Ss])?\s*$/
      return true
    elsif answer =~ /^\s*[Nn][Oo]?\s*$/
      return false
    end
  puts "\n⚠️  That doesn't look like yes or no.".colorize(:light_yellow)
  end
end

# ask user if they want to update the details for any existing planets before exiting
# function not useful since this information isn't stored for future runs
# could be useful later down the line when i don't have to hard code
def closing(edit_info, edit_another, planet_instances)
  puts "\n⚠️  Before you go, please help us keep our encyclopedia up to date.\nIf you noticed any erroneous information, edit the entry for that planet.".colorize(:light_yellow)
  user_input = ask_user_to_edit(edit_info, planet_instances)
    until user_input.nil?
      puts "\nAwesome, thanks for updating the entry for #{user_input[:name]}!"
      user_input = ask_user_to_edit(edit_another, planet_instances)
    end
  puts "\nTHANKS FOR CHECKING OUT PLANET-PEDIA!".colorize(:light_blue)
  exit
end

### END REGULAR FUNCTIONS ###
### START RE-USED STRINGS ###

info_intro = "we can give you information about the following:"
add_question = "❓ Would you like to add a planet to our encyclopedia?".colorize(:light_red)
add_another = "❓ Would you like to add another planet to our encyclopedia?".colorize(:light_red)
entire_question = "❓ Do you want to see the entire encyclopedia at one time?".colorize(:light_red)
single_question = "❓ Do you want to learn about one of the planets listed above?".colorize(:light_red)
learn_another = "❓ Do you want to learn about another planet listed above?".colorize(:light_red)
edit_info = "❓ Do you want to edit the entry for one of the planets?".colorize(:light_red)
edit_another = "❓ Do you want to edit the entry for another planet?".colorize(:light_red)

### END RE-USED STRINGS ###
### START BODY CODE ###

# turn basic_planets array of hashes into instances of the class Planet and store in another array
basic_planets.each_with_index do |facts_about_planet, index|
  planet_instances << Planet.new(facts_about_planet)
end

# transform all instances of the class Planet into an instance of the class SolarSystem
solar_system = SolarSystem.new(planet_instances)

puts "WELCOME TO PLANET-PEDIA!".colorize(:light_blue) + "\n\n#{info_intro.capitalize}\n\n"

puts solar_system.return_planets_with_numbers

user_input = ask_user_to_add_planet(add_question, planet_instances)

# if user decides to add planets push these to the single istance of the class SolarSystem
until user_input.empty?
    solar_system.add_another_planet(user_input)
    puts "\nGreat, thanks for adding a planet to our encyclopedia!\n\nNow, #{info_intro}\n\n"
    puts solar_system.return_planets_with_numbers
    user_input = ask_user_to_add_planet(add_another, planet_instances)
end

# close out program if user decides to print see all of the planets in the instance of SolarSystem
closing_requested = ask_user_print_everything(entire_question, solar_system)

if closing_requested
  closing(edit_info, edit_another, planet_instances)
end

# close out program once user is finished viewing the details for instances of the class Planet one at a time
closing_requested = ask_user_planet_info(single_question, learn_another, planet_instances)

if closing_requested
  closing(edit_info, edit_another, planet_instances)
end

# END BODY CODE
