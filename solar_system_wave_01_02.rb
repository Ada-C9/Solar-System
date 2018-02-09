class SolarSystem

  def initialize(input_planets)
    @planets = input_planets
  end

  def input_planets
    return @planets
  end

  def summary
    return "#{@planets}"
  end

end

class Planet

  attr_accessor :name, :order, :type, :temperature, :random, :year_length, :distance_from_the_black_hole

  def initialize(describe_planet)
    @name = describe_planet[:name]
    @order = describe_planet[:order]
    @type = describe_planet[:type]
    @temperature = describe_planet[:temperature]
    @random = describe_planet[:random]
    @year_length = describe_planet[:year_length]
    @distance_from_the_black_hole = describe_planet[:distance_from_the_black_hole]
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

planets = [Planet.new(miller), Planet.new(mann), Planet.new(edmunds)]
# p planets

gargantua_solar_system = SolarSystem.new([planets])
puts "\nHere is the array of the Solar System Gargantua with an array of some planets within:"
puts "\n#{gargantua_solar_system.summary}"

puts "\nListed are the planets surrounding the Black Hole Gargantua"
puts '1) Miller'
puts '2) Mann'
puts '3) Edmunds'

user_choice = ["1", "2", "3", "exit"]

puts "\nWhich planet would you like to learn more about? (Enter the number associated with the planet)"
planet_selection = gets.chomp.downcase

while user_choice.include?(planet_selection)

  case planet_selection
  when "1"
    puts "\n#{planets[0].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "2"
    puts "\n#{planets[1].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "3"
    puts "\n#{planets[2].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "exit"
    puts "\nThanks for taking a look! Goodbye!"
    break
  end
end

until user_choice.include?(planet_selection)
  puts "\nInvalid entry. Try again.\n"
  print "\nWhat would you like to do?"
  planet_selection = gets.chomp.downcase

  case planet_selection
  when "1"
    puts "\n#{planets[0].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "2"
    puts "\n#{planets[1].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "3"
    puts "\n#{planets[2].summary}"
    puts"\nThat was interesting. What other planet would you like to learn about?"
    planet_selection = gets.chomp.downcase

  when "exit"
    puts "\nThanks for taking a look! Goodbye!"
    break
  end

  while user_choice.include?(planet_selection)

    case planet_selection
    when "1"
      puts "\n#{planets[0].summary}"
      puts"\nThat was interesting. What other planet would you like to learn about?"
      planet_selection = gets.chomp.downcase

    when "2"
      puts "\n#{planets[1].summary}"
      puts"\nThat was interesting. What other planet would you like to learn about?"
      planet_selection = gets.chomp.downcase

    when "3"
      puts "\n#{planets[2].summary}"
      puts"\nThat was interesting. What other planet would you like to learn about?"
      planet_selection = gets.chomp.downcase

    when "Exit", "exit"
      puts "\nThanks for taking a look! Goodbye!"
      break
    end
  end
end

puts ""

# Present the user with a list of planets from which they can choose. Something like:
# 1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit
# Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
# Then ask the user for another planet.
