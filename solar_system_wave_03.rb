class SolarSystem

  def initialize(total_planets)
    @planets = total_planets
  end

  def total_planets
    return @planets
  end

  # Optional Wave 3
  # Give your Solar System an 'age'

  def summary
    return "#{@planets} and whatever other details I may want to use for my solar system....moons, comets, asteroids, etc"
  end

end

class Planet
  # ASK INSTRUCTOR to go over this again maybe? Or do ore research....
  # Need the below explained better, because if I comment it out, it still works....
  attr_accessor :name, :order, :type, :temperature, :random, :year_length, :distance_from_the_black_hole

  # One argument of a whole hash
  # One parameter for 'describe_planet'

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

def main_menu
  puts "\n=====MAIN MENU====="
  puts "\n1. View List of Existing Planets"
  puts "2. Create Planet"
  puts "3. Pick Planet to Learn More About"
  puts "4. Exit"
  print "\nPlease enter a number: "
  return gets.chomp.to_i
end

def planets_list(planets)
  puts "\n=====GARGANTUA SOLAR SYSTEM====="
  puts "\nListed are the planets surrounding the Black Hole Gargantua: "

  # printing the planet index and value calling upon the name method in the Planet class
  planets.each_with_index {|planet, i| puts "#{i + 1}. #{planet.name}"}

  print "\n**PRESS ANY KEY TO CONTINUE**"
  user_choice = gets.chomp
end

def new_planet
  puts "\n=====CREATE PLANET====="
  puts "\nPlease create a planet!"

  # This will reflect the same type of info as the hardcoded data when manually entered
  create_planet = {}

  print " - Planet Name: "
  name_input = gets.chomp.capitalize
  create_planet[:name] = name_input

  print " - Order: "
  name_input = gets.chomp.downcase
  create_planet[:order] = name_input

  print " - Type: "
  type_input = gets.chomp.downcase
  create_planet[:type] = type_input

  print " - Highest Temperature (Degrees F) (integer): "
  temp_input = gets.chomp.to_i
  create_planet[:temperature] = temp_input

  print " - Random Info: "
  random_input = gets.chomp.downcase
  create_planet[:random] = random_input

  print " - Years to Revolve Around Black Hole (integer): "
  years_input = gets.chomp.to_i
  create_planet[:year_length] = years_input

  print " - Distance From Black Hole (In Miles) (integer): "
  distance_input = gets.chomp.to_i
  create_planet[:distance_from_the_black_hole] = distance_input

  # ######ARRAY######## #
  # Each planet created gets pushed to the planets  array
  return Planet.new(create_planet)

end

def learn_about_planet(planets)
  puts "\n=====INFO====="
  puts "\nPlease make a selection with regards to learning more about them!"
  puts "(OR enter '#{planets.length + 1}' to exit)\n"

  planets.each_with_index { |planet, i| puts "#{i + 1}. #{planet.name}"}

  # Exit has no summary, so cannot push 'Exit' into array below w/ number
  puts "#{planets.length + 1}. Return to Main Menu"

  # Create array to convert to string
  planet_selection = []

  planets.each_with_index {|planet, i| planet_selection << (i + 1).to_s}

  print "\nPlease enter a number: "
  user_choice = gets.chomp.downcase

  until user_choice == "#{planets.length + 1}" # <--- number to return to main menu

    if planet_selection.include?(user_choice)
      puts "\n=====#{planets[user_choice.to_i-1].name}====="
      puts "\n#{planets[user_choice.to_i-1].summary}"
      print "\n**PRESS ANY KEY TO CONTINUE**"
      user_choice = gets.chomp

      puts "\n=====INFO====="
      puts"\nThat was interesting. What other planet would you like to learn about?"
      puts "(OR enter '#{planets.length + 1}' to return to the Main Menu)\n"
      planets.each_with_index { |planet, i| puts "#{i + 1}. #{planet.name}"}
      puts "#{planets.length + 1}. Return to Main Menu"

      puts "\n=====INFO====="
      print "\nPlease enter a number: "
      user_choice = gets.chomp

    else
      puts "\n=====INVALID ENTRY====="
      puts "\nInvalid entry. Try again."
      puts "(OR enter '#{planets.length + 1}' to return to the Main Menu)\n"
      planets.each_with_index { |planet, i| puts "#{i + 1}. #{planet.name}"}
      puts "#{planets.length + 1}. Return to Main Menu"
      print "\nPlease enter a number: "
      user_choice = gets.chomp
    end
  end
end

planets = [Planet.new(miller), Planet.new(mann), Planet.new(edmunds)]

menu_options = main_menu

until menu_options == 4

  case menu_options
  when 1
    planets_list(planets)

  when 2
    planets <<  new_planet
    print "\n**PRESS ANY KEY TO CONTINUE**"
    user_choice = gets.chomp

  when 3
    learn_about_planet(planets)

  else
    puts "\n=====INVALID ENTRY====="
    puts "\nInvalid entry. Try again."
    print "\n**PRESS ANY KEY TO CONTINUE**"
    user_choice = gets.chomp
  end
  menu_options = main_menu
end

puts "\n=====EXIT====="
puts "\nThanks for checking out the Gargantua Universe! Try to not get sucked into the Black Hole!!"
puts ""
exit
