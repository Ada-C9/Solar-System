class SolarSystem

  attr_accessor :planets

  def initialize(planets)
      @planets = planets
  end

  def list
    name_list = []
    n = 0
    @planets.each do |planet|
      name_list << "#{n + 1}. #{planet.name}"
      n += 1
    end
    return name_list
  end

end


class Planet

  attr_accessor :name, :moons, :year, :climate, :aliens, :age

  def initialize(name, moons, year, climate, aliens, age)
    @name = name
    @moons = moons
    @year = year
    @climate = climate
    @aliens = aliens
    @age = age
  end

  def summary
    return "#{@name}:
    #{@name} has #{@moons} moons.
    It takes #{@year} years to get around the sun
    and has a #{@climate} climate.
    Does it have aliens? #{@aliens}
    #{@name} is #{@age} years old"
  end

end

Mercury = Planet.new("Mercury", 3, 0.7, "hot", "yes", 8088 )
Venus = Planet.new("Venus", 7, 3, "cold", "no", 10009 )
Earth = Planet.new("Earth", 4, 1, "warm", "yes", 2993884 )
Mars = Planet.new("Mars", 3, 5, "dry", "no", 987323 )
Jupiter = Planet.new("Jupiter", 2, 4, "gassy", "yes", 208345 )
Hoth = Planet.new("Hoth", 0, 80, "deadly", "yes", 38775203 )

planet_list = [ Mercury, Venus, Earth, Mars, Jupiter, Hoth ]
user_planet_list = [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Hoth" ]

Milky_Way = SolarSystem.new(planet_list)


puts "\n---Welcome to Mary's 100% REAL encyclopedia of the Milky Way---"

loop do

puts "\n\nCheck out the planets you can learn about!
Type the planet name or 'new' if you're a genius and discovered a new one!\n"

puts Milky_Way.list

user_choice = gets.chomp.capitalize

until user_choice == "New" || user_planet_list.include?(user_choice)
  puts "Please pick a planet or type new"
  user_choice = gets.chomp.capitalize
end

if user_choice == "New"
  print "Great, what's your new planet's name? "
  user_name = gets.chomp.capitalize
  print "How many moons does it have? "
  user_moon = gets.chomp.to_i
  print "How long is it's year (in Earth years)? "
  user_year = gets.chomp.to_f
  print "What is the climate like? "
  user_climate = gets.chomp
  print "Does it have aliens? "
  user_aliens = gets.chomp
  print "How old is #{user_name}? "
  user_age = gets.chomp.to_i
  user_choice = Planet.new("#{user_name}", "#{user_moon}", "#{user_year}", "#{user_climate}", "#{user_aliens}", "#{user_age}")
  user_planet_list << user_name
  planet_list << user_choice
elsif user_planet_list.include?(user_choice)
  planet_list.each do |planet|
    if user_choice == planet.name
      puts "#{planet.summary}"
    end
  end
end

end
