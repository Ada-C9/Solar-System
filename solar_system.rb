# classes
class Planet

  attr_reader :name, :moons, :distance_fromsun, :mass, :orbit_period

  def initialize(name, moons, distance_fromsun, mass, orbit_period)
    @name = name
    @moons = moons
    @distance_fromsun = distance_fromsun
    @mass = mass
    @orbit_period = orbit_period
  end

# The method attributes returns the information of the planet selected by the user in the interface
  def attributes
    return "\n Name: #{@name}\n Moons: #{@order}\n Distance from the Sun: #{@distance_fromsun}\n Mass: #{@diameter}\n Orbit Period = #{@orbit_period}\n "
  end

end

class SolarSystem

  attr_accessor  :planets

  def initialize(planets)
    @planets = planets
  end

  def add_planet(planet)
    @planets.push(planet)
  end

  def list_planets
    list = ""
    @planets.each_with_index do |planet, i|
      list += "#{i+1} #{planet.name}\n"
    end
    return list
  end

end

# Instances
planet_A = Planet.new('Mercury','0','57,909,227 km','38', '88 days')
planet_B = Planet.new('Venus', '0','108,209,475 km','95', '225 days')
planet_C = Planet.new('Earth','1','149,598,262 km','211','365.24 days')
planet_D = Planet.new('Mars','2','227,943,824 km ', '408','1.9 years')
planet_E = Planet.new('Jupiter','1','778,340,821 km ','38','11.9 years')

planets = [planet_A, planet_B, planet_C, planet_D, planet_E]
system_ = SolarSystem.new(planets)

# Method for the user to create a new planet
def new_planet(solar)

  # The loop will enable the user to continue adding new planets until wanted.
  user_create = " "
  until user_create == "N"
    puts "Let's build your planet's details: "
    print "Name: "
    name = gets.chomp
    print "Moons: "
    order = gets.chomp
    print "Distance from the sun: "
    distance = gets.chomp
    print  "Mass: "
    diameter = gets.chomp
    print "Orbit period: "
    orbit = gets.chomp

    user_planet = Planet.new(name, order, distance, diameter, orbit)
    solar.add_planet(user_planet)

    puts "----Here's the information of your planet: "
    puts user_planet.attributes

    puts "----Updated Solar System list: "
    print solar.list_planets

    puts "\nWould you like to create another planet?: Enter Y for yes and N for no: "
    user_create = gets.chomp.upcase
  end
end

# Method that prints the information of the planet selected by the user
def read_aboutplanets(system_)

    print "\nSelect a planet by entering its corresponding number from the list above: "
    planet_selected  = gets.chomp.to_i

    if planet_selected <= system_.planets.length && planet_selected >= 1
      puts system_.planets[planet_selected - 1].attributes

    else
      puts "\nInvalid input. Please enter a number between 1 and #{system_.planets.length}"
      again(system_)
    end

end

# Method for the user to choose to create or read about a planet during interface
def interface(system_)

  print "\nEnter R to read about a planet or C to create a planet: "
  user_input1 = gets.chomp.upcase

  case user_input1
  when "C"
    new_planet(system_)
    again(system_)
  when "R"
    read_aboutplanets(system_)
    again(system_)
  else
    puts "Not a valid input"
    again(system_)
  end

end

# Method to ask the user if wants to continue running the program
# or to change between creating a new planet or reading about a current planet.
# the list of planets will be updated if the user creates a planet before.
def again(system_)

  print "\nWould you like to continue?: "
  user_input2 = gets.chomp.upcase

  case user_input2
  when "Y"
    puts "\nUpdated list of planets"
    print system_.list_planets
    interface(system_)
  when "N"
    puts "\nThank you for visiting our Solar System Program!"
    exit
  else
    puts "\nNot a valid input!"
  end

end

# Welcome message for user
puts "Hi Welcome to our Solar System!"

puts "\nTake a look to our current planet's list:"

# The current planets list will be printed
print system_.list_planets

# Planets list will be updated
interface(system_)

# Planets list will be updated
again(system_)

puts "\nThank you for visiting our Solar System Program!"
