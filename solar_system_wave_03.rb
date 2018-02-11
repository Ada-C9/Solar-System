class SolarSystem

  def initialize(total_planets)
    @planets = total_planets
  end

  def total_planets
    return @planets
  end

  def summary
    return "#{@planets} and whatever other details I may want to use for my solar system....moons, comets, asteroids, etc"
  end

end

class Planet

  attr_accessor :name, :order, :type, :temperature, :random, :year_length, :distance_from_the_black_hole

  # One argument for the planet which is the key of the planet with their respective value or symbols
  def initialize(describe_planet)
    # each instance variable will take place of the symbol called outside the class
    @name = describe_planet[:name]
    @order = describe_planet[:order]
    @type = describe_planet[:type]
    @temperature = describe_planet[:temperature]
    @random = describe_planet[:random]
    @year_length = describe_planet[:year_length]
    @distance_from_the_black_hole = describe_planet[:distance_from_the_black_hole]
  end

  def name
    return "#{@name}"
  end

  def summary
    return "Planet #{@name} may be considered a(n) #{@type}. The highest surface temp is #{@temperature} degrees Farenheight. A random fact is #{@random}. It takes #{@year_length} years to rotate around the black hole. The distance from the black hole itself is #{@distance_from_the_black_hole} miles. #{@name} is #{@order} in this solar system of least likely to be habitable."
  end
end

miller = {
  name: 'Miller',
  order: 'first',
  type: 'water world',
  temperature: 170,
  random: ' it is shaped like a football with a tidal wave constantly being pulled by the gravity of the black hole',
  year_length: 100 ,
  distance_from_the_black_hole: 93
}

mann = {
  name: 'Mann',
  order: 'second' ,
  type: 'ice planet',
  temperature: -10,
  random: "it usually is extremely cold, yet life may in fact survive here",
  year_length: 55,
  distance_from_the_black_hole: 250
}

edmunds = {
  name: 'Edmunds',
  order: 'third' ,
  type: 'the most likely habitable place',
  temperature: 128,
  random: "while it is a barren desert, it has breathable air and possibly water too",
  year_length: 2,
  distance_from_the_black_hole: 150
}
puts "\nListed are the planets surrounding the Black Hole Gargantua"

# Creating the first set of planets with hard code and storing them in the array 'planets'

planets = [Planet.new(miller), Planet.new(mann), Planet.new(edmunds)]

# printing the planet index and value calling upon the name method in the Planet class
planets.each_with_index {|planet, i| puts "#{i + 1}. #{planet.name}"}

# Manually create as many planets as you want using a loop
print "\nWould you like to create a planet: "
create_planet_option = gets.chomp.downcase

until create_planet_option == '2' || create_planet_option == 'no'

  case create_planet_option
  when '1', 'yes'
    puts "\nPlease create a planet!"

    # This will reflect the same type of info as the hardcoded data when manually entered
    create_planet = {}

    print "Planet Name: "
    name_input = gets.chomp.downcase
    create_planet[:name] = name_input

    print "Order: "
    name_input = gets.chomp.downcase
    create_planet[:order] = name_input

    print "Type: "
    type_input = gets.chomp.downcase
    create_planet[:type] = type_input

    print "Temperature: "
    temp_input = gets.chomp.downcase
    create_planet[:temperature] = temp_input

    print "Random Info: "
    random_input = gets.chomp.downcase
    create_planet[:random] = random_input

    print "Years to Revolve Around Black Hole: "
    years_input = gets.chomp.downcase
    create_planet[:year_length] = years_input

    print "Distance From Black Hole (In Miles): "
    distance_input = gets.chomp.downcase
    create_planet[:distance_from_the_black_hole] = distance_input

    # Each planet created gets pushed to the planets  array
    planets << Planet.new(create_planet)

    print "\nWould you like to create a planet: "
    create_planet_option = gets.chomp.downcase

  else
    puts "\nInvalid entry, please try again."
    puts "\nPlease use: "
    puts "1. Yes"
    puts "2. No"
    print "\nWould you like to create a planet: "
    create_planet_option = gets.chomp.downcase
  end
end

# Putting all the planets hard coded and manually created into the Gargantua Solar System array by calling upon the SolarSystem Class method
gargantua_solar_system = SolarSystem.new([planets])
# puts "\nHere is the array of the Solar System Gargantua with an array of some planets within:"
# puts "\n#{gargantua_solar_system.summary}"

# Updated List with the added planets to the hard coded ones
puts "\nListed are the updated planets surrounding the Black Hole Gargantua"

planets.each_with_index { |planet, i| puts "#{i + 1}. for #{planet.name}"}

puts "#{planets.length + 1}. Exit"

# Create array to convert to string
planet_selection = []

planets.each_with_index {|planet, i| planet_selection << (i + 1).to_s}

puts "\nWhich planet would you like to learn more about? (Enter the number associated with the planet)"
user_choice = gets.chomp.downcase

# Another loop to learn about all planets hard coded and manually entered until the user 'exits' the program.

until user_choice == "#{planets.length + 1}" || user_choice == 'exit'

  if planet_selection.include?(user_choice)

    puts "\n#{planets[user_choice.to_i-1].summary}"

    puts"\nThat was interesting. What other planet would you like to learn about?"
    user_choice = gets.chomp.downcase

  else
    puts "\nInvalid entry. Try again."
    puts "\nWhich planet would you like to learn more about? (Enter the number associated with the planet)"
    user_choice = gets.chomp.downcase

    if user_choice == "#{planets.length + 1}" || user_choice == 'exit'
      puts "\nThanks for checking out the Gargantua Universe! Try to not get sucked into the Black Hole!!"
      exit
    end
    puts "\n#{planets[user_choice.to_i-1].summary}"

    puts"\nThat was interesting. What other planet would you like to learn about?"
    user_choice = gets.chomp.downcase
  end
end

# END
puts "\nThanks for checking out the Gargantua Universe! Try to not get sucked into the Black Hole!!"
puts ""
exit
