# SolarSystem_Project

# Creat a SolarSystem class.
class SolarSystem
  attr_reader :planets, :planet_names, :name_pool

  # Create a contructor to initialize the class
  # The parameter is an array pf Planet s.
  def initialize(planets)
    @planets = planets
    #@age = rand(9999)
  end

  # Create method to add a new planet to planet library
  def add_planet(new_planet)
    return @planets << new_planet
  end

  # Creat a method to show all planets name for user to choose
  # and store all planet names in an array to check if user's choice is
  # in the planet library
  def show_library
    @name_pool = []
    @planet_names = ""
    @planets.length.times do |i|
      @planet_names += "#{i + 1}. #{@planets[i].name}\n"
      @name_pool << @planets[i].name
    end
    return @planet_names
  end

  # Create a method to find the attributes of user's choice of planet
  def attributes_of_planet(planet_of_choice)
    planet_attributes = ""
    @planets.each do |planet_info|
      if planet_info.name == planet_of_choice
        planet_attributes += "#{planet_info.name}'s attributes:"
        planet_attributes += "\nIt has a diameter of #{planet_info.diameter}."
        planet_attributes += "\nIts gravity is #{planet_info.gravity}."
        planet_attributes += "\nIt takes #{planet_info.year_length} to spin on Axis."
        planet_attributes += "\nIts distance from the sun is #{planet_info.distance_from_the_sun}.\n"
      end
    end
    return planet_attributes
  end

  # Create a  method to calculate the distance rom a target planet to other planets.
  def distance_from_other_planet(planet_name)
    @planets.each do |each_planet|
      if each_planet.name == planet_name
        @planets.delete(each_planet)
        distance_info = ""
        @planets.each do |other_planet|
          distance_info += "The distance from #{planet_name} to #{other_planet.name} is #{(each_planet.distance_from_the_sun.split[0].to_i - other_planet.distance_from_the_sun.split[0].to_i).abs} miles.\n"
        end
        return distance_info
      end
    end
  end

end
# Create a new class Planet
class Planet
  attr_reader :name, :diameter, :gravity, :year_length, :distance_from_the_sun

  # Creat a constructor to initialize the class
  def initialize(name, diameter, gravity, year_length, distance_from_the_sun)
    @name = name
    @diameter = diameter
    @gravity = gravity
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
  end

  def show_attributes
    plant_attributes += "#{@name}'s attributes:"
    plant_attributes += "\nIt has a diameter of #{@diameter}."
    plant_attributes += "\nIts gravity is #{@gravity}."
    plant_attributes += "\nIt takes #{@year_length} to spin on Axis."
    plant_attributes += "\nIts distance from the sun is #{@distance_from_the_sun}.\n"
    return plant_attributes
  end

end

# The planet pool is an array holding hashes of planet info.
pool = [
  {
    name: "Mercury",
    diameter: "3,301 miles",
    gravity: 0.36,
    year_length: "59 days",
    distance_from_the_sun: "36000000 miles",
  },
  {
    name: "Venus",
    diameter: "7,521 miles",
    gravity: 0.9,
    year_length: "243 days",
    distance_from_the_sun: "67000000 miles",
  },
  {
    name: "Earth",
    diameter: "12,765 miles",
    gravity: 1,
    year_length: "23 hours, 56 mins",
    distance_from_the_sun: "92960000 miles",
  },
  {
    name: "Jupiter",
    diameter: "88,846 miles",
    gravity: 2.64,
    year_length: "9 hours, 55 mins",
    distance_from_the_sun: "483500000 miles",
  },
  {
    name: "Saturn",
    diameter: "74,900 miles",
    gravity: 1.16,
    year_length: "10 hours, 39 mins",
    distance_from_the_sun: "888750000 miles",
  },
  {
    name: "Uranus",
    diameter: "31,763 miles",
    gravity: 1.11,
    year_length: "17 hours, 14 mins",
    distance_from_the_sun: "1783744000 miles",
  },
  {
    name: "Neptune",
    diameter: "30,779 miles",
    gravity: 1.21,
    year_length: "16 hours, 7 mins",
    distance_from_the_sun: "2797770000 miles",
  },
  {
    name: "Mars",
    diameter: "4,222 miles",
    gravity: 0.38,
    year_length: "24 hours, 37 mins",
    distance_from_the_sun: "141700000 miles",
  }
]

# Create a method to create a pool of Planet instance by using pool information which is an array
def pool_to_planet(pool)
  # Create a variable to store all new Planet s
  library_of_planets = []
  pool.each do |planet_info|
    library_of_planets << planet = Planet.new(planet_info[:name], planet_info[:diameter], planet_info[:gravity],
      planet_info[:year_length], planet_info[:distance_from_the_sun])
    end
    return library_of_planets
  end

  library = SolarSystem.new(pool_to_planet(pool))

  # Create a user interface allowing user to interact with the solar system
  # This program allow user to learn attributes of a planet and create their own planet
  puts "Welcome to the Fun Solar System program!
  Here not only you can learn planets from our library,
  but also you can create your own planet."

  flag = true
  while flag
    puts "\n********** I AM LIBRARY **********"
    puts library.show_library
    library.name_pool << "Create"
    library.name_pool << "Exit"

    puts "\n********** I AM INSTRUCTIONS **********"
    puts "Enter planet name to learn their attributes."
    puts "Enter create to add your own planet."
    puts "Enter exit to finish your journey today."

    user_choice = gets.chomp.downcase.capitalize

    until library.name_pool.include?(user_choice)
      puts "Oops! Please follow the instructions ʅ(‾◡◝)ʃ "
      puts "Enter planet name to learn their attributes."
      puts "Enter create to add your own planet."
      puts "Enter exit to finish your journey today."
      user_choice = gets.chomp.downcase.capitalize
    end

    if user_choice == "Exit"
      puts "Thanks for playing with Fun Solar System program!"
      puts "See you soon ╰(*°▽°*)╯"
      exit

    elsif user_choice == "Create"
      # Collect user's input of Planet infomation
      puts "Please enter the name of your planet: "
      user_planet_name = gets.chomp.downcase.capitalize

      # Let user enter a name which is not included in the library
      until !library.name_pool.include?(user_planet_name)
        puts "Oops! We've already had this planet. Please enter another name:"
        user_planet_name = gets.chomp.downcase.capitalize
      end

      puts "Please enter the diameter of your planet: "
      user_planet_diameter = gets.chomp.downcase

      puts "Please enter the gravity of your planet: "
      user_planet_gravity = gets.chomp.downcase

      puts "Please enter the time your planet takes to spin on Axis: "
      user_planet_year_length = gets.chomp.downcase

      puts "Please enter the distance from your planet to the sun: "
      user_planet_distance_from_the_sun = gets.chomp.downcase

      # Create an instance of Planet
      user_planet = Planet.new(user_planet_name, user_planet_diameter, user_planet_gravity,
        user_planet_year_length, user_planet_distance_from_the_sun)
        library.add_planet(user_planet)

      else
        puts library.attributes_of_planet(user_choice)
        puts library.distance_from_other_planet(user_choice)
      end

    end
