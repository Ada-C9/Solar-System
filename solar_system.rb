########### WAVE 1 ###########

# Create a SolarSystem class with an @planets instance variable.

class SolarSystem
  attr_accessor :planets

  # Create an initialize method which should take a collection (array) of planet names and store them in an @planets instance variable.

  def initialize(input)
    @planets = input
  end

  # Create a method that adds a planet to the list (not using user input).
  def add_planet(planet)
    @planets << planet
  end

  # Create a method which will RETURN, not print, a list of the planets as a String in this style:
  # 1.  Mercury
  # 2.  Venus
  # ...

  # This method handles an array of planet info
  def get_list_of_all_planets
    list = []
    i = 0
    @planets.each do |planet|
      list << "##{i + 1}. #{planet.name}"
      i += 1
    end
    return list
  end

  # This method handles and array of hashes with planet info
  def get_list_of_all_planets_hash
    list = []
    i = 0
    @planets.each do |planet|
      list << "##{i + 1}. #{planet[:name]}"
      i += 1
    end
    return list
  end

  # Wave 2: Make your SolarSystem class take an array of Planets instead of hashes.
  # When printing the planet list or planet details, it should call the corresponding method in Planet...
  # Altered method to class take an array of `Planet`s (from class Planet) instead of hashes:
  def get_list_of_all_planets_3
    list = []
    i = 0
    @planets.each do |planet|
      list << "#{i + 1}. #{planet.name}"
      i += 1
    end
    return list
  end


  # NOTES TO SELF:
  # this getter is useless because we have attr_reader OR attr_accessor :)
  # def get_planets
  #   return @planets
  # end
  # this setter is also useless because we have attr_writer OR attr_accessor :)
  # def set_planets(new_planets)
  #   @planets = new_planets
  # end

end

### - Write code to test your SolarSystem ###

# helios = SolarSystem.new(["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Hoth"])
# puts helios
# puts helios.planets

# helios.add_planet "Saturn"
# puts helios.planets

# list_of_all_planets = helios.get_list_of_all_planets
# puts list_of_all_planets

# hashes to pass into a new instance of SolarSystem class
mercury = { name: "Mercury", dist_from_sun: 57.9, num_moons: 0, mean_temp: 167, mass: 0.330 }
jupiter = { name: "Jupiter", dist_from_sun: 778.6, num_moons: 67, mean_temp: -110, mass: 1898 }

my_solar_system = SolarSystem.new( [ mercury, jupiter ] )
### I did NOT have to alter the initialize method to make it accept hashes as input; however, I DID create a new get_list_of_all_planets method to properly iterate through hash keys in order to print out a values in a numbered list of planet names

# puts my_solar_system.planets

# list_of_all_planets = my_solar_system.get_list_of_all_planets_2
# puts list_of_all_planets


########### WAVE 2 ############

# Create a `Planet` class which will represent a planet.
# Add an `initialize` method which takes several arguments and uses them to set the class' instance variables.

class Planet

  attr_accessor :name, :distance, :moons, :temp

  def initialize(planet_name, distance_from_sun, num_moons, mean_temp)
    @name = planet_name
    @distance = distance_from_sun
    @moons = num_moons
    @temp = mean_temp
  end

  # Create a method that **returns** the Planet's attributes in an easy to read fashion.
  # Create reader methods to give a user access to read the instance variables.

  def list_planet_attributes
    return "The attributes of #{@name} are: \n  Distance from the sun (10^6 km): #{@distance} \n  Number of moons: #{@moons} \n  Average temperature (C): #{@temp} \n\n"
  end

end

# instantiating new instances of Planet and storing them in global variables
mercury = Planet.new("Mercury", 57.9, 0, 167)
venus = Planet.new("Venus", 108.2, 0, 464)
earth = Planet.new("Earth", 149.6, 1, 15)
mars = Planet.new("Mars", 227.9, 2, -65)
jupiter = Planet.new("Jupiter", 778.6, 67, -110)

# array of planet objects
planets = [mercury, venus, earth, mars, jupiter]

milky_way = SolarSystem.new(planets)
# saturn = Planet.new("Saturn", 1433.5, 62, -140)
# milky_way.add_planet(saturn)


########### WAVE 3 ############

# Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.

puts "Hello! Welcome to the Milky Way Galaxy, our home Solar System. \n \nWhat would you like to do?: "

loop do
  puts "Type 'A' to learn about the planets already in our solar system. \nType 'B' to add a new planet. \nType 'C' to exit the program."
  selection = gets.chomp.downcase

  until selection == "a" || selection == "b" || selection == "c"
    puts "That is not a valid choice, try again."
    selection = gets.chomp.downcase
  end

  case selection
  when "a"
    puts "Here are the list of current planets. Please type the corresponding number to learn more."
    puts milky_way.get_list_of_all_planets
    planet_selection = gets.chomp.to_i
    until planet_selection > 0 && planet_selection <= planets.length
      put "Invalid entry, please try again."
      planet_selection = gets.chomp
    end
    puts planets[planet_selection - 1].list_planet_attributes
  when "b"
    puts "Answer the following prompts..."
    print "What is the name of your planet?: "
    name = gets.chomp
    print "What is it's distance from the sun (in 10^6 km)?: "
    distance = gets.chomp.to_i
    print "How many moons does it have?: "
    moons = gets.chomp.to_i
    print "What is it's average temperature (C)?: "
    temp = gets.chomp.to_i
    planets << Planet.new(name, distance, moons, temp)
    puts "Awesome! Here's our new list of planets: "
    puts milky_way.get_list_of_all_planets
  when "c"
    puts "Goodbye!"
    exit
  end
end
