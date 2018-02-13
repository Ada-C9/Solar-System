class SolarSystem

  def initialize(planets)
    @planets = planets
  end

  attr_reader :planets

  def puts_self
    puts self
  end

  def self.planets
    return @planets
  end
end

class Planet

  attr_accessor :name, :order, :radius, :moons

  def initialize(name, order, radius, moons)
    @name = name
    @order = order
    @radius = radius
    @moons = moons
  end

  def puts_self
    puts self
  end

  def self.name
    return @name
  end

  # instance method
  def contents
    return "  #{order}. #{name}"
  end

  def self.contents
    return @contents
  end

  def summary
    return "  #{name} - Radius: #{radius}km. Number of Moons: #{moons}."
  end

  def self.summary
    return @summary
  end

end

# input planets
  planet_arr = [
    Planet.new("Mercury", 1, 2440, 0),
    Planet.new("Venus", 2, 6052, 0),
    Planet.new("Earth", 3, 6371, 1),
    Planet.new("Mars", 4, 3390, 2),
    Planet.new("Jupiter", 5, 69911, 2),
    Planet.new("Saturn", 6, 58232, 2),
    Planet.new("Uranus", 7, 25362, 2),
    Planet.new("Neptune", 8, 24622, 2),
  ]

#outputs planets
puts
print "Welcome to this Solar System directory! Here is a list of planets: "
puts
planet_arr.each_with_index do |planet, i|
  puts "#{i+1}. #{planet.name}"
end

puts
print "Type LEARN to learn about a planet. Type NEW to add a new planet: "
selection = gets.chomp.upcase!
if selection == "LEARN"
  print "Please type the number of the planet you'd like to learn about: "
  learn_option = gets.chomp.to_i
  counter = 0
  until learn_option >= 0 &&  learn_option <= planet_arr.length
    counter += 1
    if counter == 3
      puts "Too many incorrect attempts. Goodbye"
      exit
    else
      print "You did not type a valid number. Please try again: "
      learn_option = gets.chomp.to_i
    end
  end
  puts planet_arr[learn_option-1].summary
elsif selection == "NEW"
  print "What's the planet name? "
    input_name = gets.chomp.upcase!
  print "What's the radius of #{input_name} in kilometers? "
    input_radius = gets.chomp.to_i
  print "How many moons does #{input_name} have? "
    input_moons = gets.chomp.to_i
    planet_arr << Planet.new(input_name, 0, input_radius, input_moons)
  puts "Here's an updated list of planets: "
    planet_arr.each_with_index do |planet, i|
  puts "#{i+1}. #{planet.summary} "
else
  puts "You did not enter a valid option. Goodbye"
end

end
