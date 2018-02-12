class SolarSystem
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  def returninfo
    names = ""
    (0...@planets.length).each do |num|
      names << " #{num + 1}. #{@planets[num].name}\n"
    end
    return names
  end
end

class Planet
  attr_accessor :name, :size, :color, :distance, :year

  def initialize(name, size, color, distance, year)
    @name = name
    @size = size
    @color = color
    @distance = distance
    @year = year
  end

  def show_attr
    puts "Name: #{@name}  Size:#{@size}   Color:#{@color}"
  end
end

def add_to_system
  puts "What is the planet's name?"
  adding_planet_name = gets.chomp
  puts "What is its size?"
  adding_planet_size = gets.chomp
  puts "What is its color?"
  adding_planet_color = gets.chomp
  puts "What is its distance from its sun?"
  adding_planet_distance = gets.chomp
  puts "How long is its year?"
  adding_planet_year = gets.chomp
  puts "Your planet has been added."
  return Planet.new(adding_planet_name, adding_planet_size,
  adding_planet_color, adding_planet_distance, adding_planet_year)
end

array_of_planets = [
  Planet.new("Jackie", "Biggest", "blue", "60 million miles", "2 Earth years"),
  Planet.new("Tito", "Big", "grey", "90 million miles", "3 Earth years"),
  Planet.new("Jermaine", "In the Middle", "Green", "111 million miles", "4 Earth years"),
  Planet.new("Marlon", "Little", "Yellow", "140 million miles", "7 Earth years"),
  Planet.new("Michael", "Littlest", "Silver", "500 million miles", "20 Earth years")
]

interesting_system = SolarSystem.new(array_of_planets)
banner = "
                _.u[[/;:,.         .odMMMMMM'
              .o888UU[[[/;:-.  .o@P^    MMM^
            oN88888UU[[[/;::-.        dP^
           dNMMNN888UU[[[/;:--.   .o@P^
          ,MMMMMMN888UU[[/;::-. o@^
          NNMMMNN888UU[[[/~.o@P^
          888888888UU[[[/o@^-..
          oI8888UU[[[/o@P^:--..
       .@^  YUU[[[/o@^;::---..
     oMP     ^/o@P^;:::---..
  .dMMM    .o@^ ^;::---...
  dMMMMMMM@^`     `^^^^
  YMMMUP^
   ^^

"
puts banner
puts " ❂ Welcome to Planet-pedia! ❂ \n"
puts "\nThe planets in this system are: "
puts interesting_system.returninfo

one_or_two_choice = 0
until one_or_two_choice == 3

  puts "\nYou have the following abilities:
  1. Add a planet
  2. Learn more about a planet
  3. Exit

  What is your selection? (1, 2, or 3)"
  one_or_two_choice = gets.chomp.to_i

  if one_or_two_choice == 3
    exit
  elsif one_or_two_choice == 1
    newplanet = add_to_system
    array_of_planets.push(newplanet)
  elsif one_or_two_choice == 2
    puts interesting_system.returninfo
    puts "Which planet would you like to know more about?"
    planet_selection = gets.chomp.to_i
    planet_selection -= 1
    puts "Name: #{array_of_planets[planet_selection].name}"
    puts "Size: #{array_of_planets[planet_selection].size}"
    puts "Color: #{array_of_planets[planet_selection].color}"
    puts "Distance from Sun: #{array_of_planets[planet_selection].distance}"
    puts "Year length: #{array_of_planets[planet_selection].year}"
  else
    puts "That is an invalid selection. Please try again."
  end
end
