# Define class SolarSystem
class SolarSystem
  attr_reader :name, :age, :planets

  def initialize name, age, planets
    @name = name
    @age = age
    @planets = planets
  end

  def add new_planet
    @planets << new_planet
  end

  def planet_list
    planet_list = []
    @planets.each { |planet|
      planet_list << planet.name
    }
    return planet_list
  end

  def planet_details
    planet_details = []
    @planets.each { |planet|
      planet_details << planet.info
    }
    return planet_details
  end

  def cal_age ref_planet
    return @age * 365.24 / ref_planet.yr_length
  end
end

# Define class Planet
class Planet
  attr_reader :name, :diameter, :mass, :yr_length, :dis_from_sun, :moons

  def initialize new_planet
    @name = new_planet["name"]
    @diameter = new_planet["diameter"]
    @mass = new_planet["mass"]
    @yr_length = new_planet["yr_length"]
    @dis_from_sun = new_planet["dis_from_sun"]
    @moons = new_planet["moons"]
  end

  def info
    info = "---#{@name}---\ndiameter\t\t#{@diameter} km\nmass\t\t\t#{@mass} kg\nyear length\t\t#{@yr_length} days\ndistance from the sun\t#{@dis_from_sun} km\nmoons\t\t\t#{@moons}"
    return info
  end

  def distance_from another_planet
    distance = (@dis_from_sun - another_planet.dis_from_sun).abs
    return distance
  end
end

# Generate a planet based on user's inputs
def generate_planet
  puts "\nLet's create a planet from scratch."
  print "Please enter its name first: "
  name = gets.chomp
  print "What's its diameter of this planet in km? "
  diameter = gets.chomp.to_f
  print "What's its mass in kg? (example of input format: 3.30 x 10^23 ) "
  mass = gets.chomp
  print "What's the year length of this planet in days? "
  yr_length = gets.chomp.to_f
  print "What's the distance from the sun to this planet in km? "
  dis_from_sun = gets.chomp.to_f
  print "How many moons does this planet have? Enter 0 if there is none. "
  moons = gets.chomp.to_i
  planet = Planet.new({"name" => name, "diameter" => diameter, "mass" => mass, "yr_length" => yr_length, "dis_from_sun" => dis_from_sun, "moons" => moons})
  return planet
end

# Create instances of planets in the solar system
mercury = Planet.new({"name" => "Mercury", "diameter" => 4879, "mass" => "3.30 x 10^23", "yr_length" => 88, "dis_from_sun" => 57909227, "moons" => 0})
venus = Planet.new({"name" => "Venus", "diameter" => 12104, "mass" => "4.87 x 10^24", "yr_length" => 225, "dis_from_sun" => 108209475, "moons" => 0})
earth = Planet.new({"name" => "Earth", "diameter" => 12714, "mass" => "5.97 x 10^24", "yr_length" => 365.24, "dis_from_sun" => 149598262, "moons" => 1})
mars = Planet.new({"name" => "Mars", "diameter" => 6792, "mass" => "6.42 x 10^23", "yr_length" => 687, "dis_from_sun" => 227943824, "moons" => 2})
jupiter = Planet.new({"name" => "Jupiter", "diameter" => 133709, "mass" => "1.90 × 10^27", "yr_length" => 4333, "dis_from_sun" => 778340821, "moons" => 67})
saturn = Planet.new({"name" => "Saturn", "diameter" => 120536, "mass" => "5.68 × 10^26", "yr_length" => 10756, "dis_from_sun" => 1426666422, "moons" => 62})
uranus = Planet.new({"name" => "Uranus", "diameter" => 51118, "mass" => "8.68 × 10^25", "yr_length" => 30687, "dis_from_sun" => 2870658186, "moons" => 27})
neptune = Planet.new({"name" => "Neptune", "diameter" => 49528, "mass" => "1.02 × 10^26", "yr_length" => 60190, "dis_from_sun" => 4498396441, "moons" => 14})
planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
sun = SolarSystem.new("Sun", 4600000000, planets)

# UI welcome message
puts "\nWelcome to the Solar System program. What would you like to do?\n1. Summary  2. Learn about planets  3. Add a new planet  4. Do Math  5. Exit"

# Helper method to collect and validate user's choice
def valid_choice(range)
  choice = gets.chomp.to_i
  until (1..range).include?(choice)
    print "Please enter a valid choice: "
    choice = gets.chomp.to_i
  end
  return choice
end

# Helper method to print out planet list
def print_list(solar_system)
  solar_system.planet_list.each_index do |i|
    print "#{i + 1}. #{solar_system.planet_list[i]}  "
  end
end

# Options
choice_1 = valid_choice(5)
until choice_1 == 5
  case choice_1
    # 1. Summary
    when 1
      print "\nThe Sun (or Sol), is the star at the centre of our solar system and is responsible for the Earth’s climate and weather. The Sun is an almost perfect sphere with a difference of just 10km in diameter between the poles and the equator. The average radius of the Sun is 695,508 km (109.2 x that of the Earth) of which 20–25% is the core. There are #{sun.planets.length} planets in our system: "
      print_list(sun)
    # 2. Learn about planets
    when 2
      puts "\nPlease pick one planet from the following list:"
      print_list(sun)
      puts "#{sun.planets.length + 1}. Exit\n"

      choice_2 = valid_choice(sun.planets.length + 1)
      until choice_2 == (sun.planets.length + 1)
        puts sun.planet_details[choice_2 - 1]
        puts "\nPlease pick another one if you like. Enter #{sun.planets.length + 1} to exit."
        choice_2 = valid_choice(sun.planet_list.length + 1)
      end
    # 3. Add a new planet
    when 3
      new_planet = generate_planet
      sun.add(new_planet)
      puts "\nA new planet called #{new_planet.name} has been created by YOU and saved to our solar system! Go to \"Learn about planets\" to check out its profile."
      puts "Below is a brief summary of its properties:"
      puts new_planet.info
    # 4. Do Math
    when 4
      puts "\nLet's calculate some fun numbers!"
      puts "First, pick one planet from the following list:"
      print_list(sun)
      puts "\n"

      # Calculate age of sun based on reference planet
      choice_3 = valid_choice(sun.planets.length)
      if choice_3 != 3 # Order of Earth on the planet list
        ref_age = sun.cal_age(sun.planets[choice_3 - 1])
        puts "\nYou picked #{sun.planets[choice_3 - 1].name}!\nWe know that the solar system is #{sun.age} years old in earth years. This number will change to #{ref_age} if we adopt #{sun.planets[choice_3 - 1].name} years."
      else
        puts "\nYou picked #{sun.planets[choice_3 - 1].name}.\nThe solar system is #{sun.age} years old in earth years."
      end

      # Calculate distance between the two chosen planets
      puts "\nNow pick another planet from the list:"
      choice_4 = valid_choice(sun.planets.length)
      distance = sun.planets[choice_3 - 1].distance_from(sun.planets[choice_4 - 1])
      puts "\nYou picked #{sun.planets[choice_4 - 1].name}!\nThe distance between #{sun.planets[choice_3 - 1].name} and #{sun.planets[choice_4 - 1].name} is #{distance} km."
  end

  puts "\n\nWhat would you like to do next?\n1. Summary  2. Learn about planets  3. Add a new planet  4. Do Math  5. Exit"
  choice_1 = valid_choice(5)
end
