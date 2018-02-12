class Solar_S
  attr_accessor :planets

  def initialize (planets)
    @planets = planets
  end
  # puts out list of just the planets in the solar system
  def summary
    x = 1
    planet_sum = []
    @planets.each do |planet|
      planet_sum << "#{x}. #{planet.name}"
      x += 1
    end
    return planet_sum
  end
  # allows user to pick a planet amongst the solar system
end

class Planet
  ## Create reader methods to give a user access to read the instance variables.
  attr_accessor :name, :color, :order, :year_length, :distance_from_the_sun
  ### Add an initialize method which takes several arguments
  def initialize (name, color, order, year_length, distance_from_the_sun)
    @name = name
    @color = color
    @order = order
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
  end
  # adds the new planet created by user to the whole solar system array
  def planet_bio
    planet_sum = []
    planet_sum << "Name:#{name}\ncolor:#{color}\nOrder In Solar System:#{order}\nYear Length:#{year_length}\nDistance From The Sun:#{@distance_from_the_sun}"
    return planet_sum
  end
end

def new_planet
  puts "What is the name of your planet?"
  name = gets.chomp
  puts "What color is your planet?"
  color = gets.chomp
  puts "What order is it in the solar system?"
  order = gets.chomp
  puts "How long is a year on your planet in Earth days?"
  year_length = gets.chomp
  puts "How far is the planet from our Sun?"
  distance_from_the_sun = gets.chomp
  x = Planet.new("#{name}","#{color}", "#{order}","#{year_length}", "#{distance_from_the_sun}")
  return x
end

milky_way =
[
  Planet.new("Mercury","silver","1st","87.96 Earth days","0.39 AU"),
  Planet.new("Venus","yellow","2nd","224.68 Earth days","0.723 AU"),
  Planet.new("Earth","Blue and Green","3rd","364 Earth days","92.95 M"),
  Planet.new("Mars","Red","4th","687 Earth days","141.6M"),
  Planet.new("Jupiter","Orange","5th","4,300 Earth days","483.8M"),
  Planet.new("Saturn","Yellow","6th","11,000 Earth days","888.2M"),
  Planet.new("Uranus","Teal","7th","31,000 Earth days","1.784 BM"),
  Planet.new("Neptune","Blue","8th","60,200 Earth days","2.795 BM"),
  Planet.new("Pluto","Grey","9th","90,500 Earth days","7.38 BM")
]
my_universe = Solar_S.new(milky_way)

puts "Welcome to the Planetarium.\nWould you like to view or add a planet?"
welcome_choice = gets.chomp.downcase

if welcome_choice == "view"
  puts "Good choice, let me show you our planets"
  puts my_universe.summary
  puts "Which planet would you like to view?"
  user_choice = gets.chomp
  found = false
  my_universe.planets.each do |planet|
    if user_choice == planet.name
      puts planet.planet_bio
      found = true
    end
  end
  if found == false
    puts "This planet is not in our solar system."
  end
elsif welcome_choice == "add"
  puts "Ooo interesting, lets get some more info."
  milky_way << new_planet
  puts my_universe.summary
else
  puts "Sorry, that does not make any sense."
end
