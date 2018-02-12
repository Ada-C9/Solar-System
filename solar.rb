# our customer will be able to interact with the program and
# choose which pieces of information they can see at a time,
# specifically by choosing which planet.
# sudo gem install samsouder-titlecase --source=http://gems.github.com

require 'rubygems'
require 'titlecase'

class SolarSystem

  attr_accessor :planet_details, :choose_planet, :planets, :planet_list, :add_planet

  def initialize(planets)
    @planets = planets
  end
  # has an instance method that returns the planet details based on user input

  def planet_list
    planet_array = []
    @planets.each_with_index do |planet, index|
      # **--->how to do without storing list in an array as a variable??
      # **--->prints whole array of hashes if not
      current_planet = "#{index + 1}. #{planet.name}"
      planet_array << current_planet
    end
    return planet_array
  end

  def updated_list
    updated_array = []
    @planets.each_with_index do |planet, index|
      current_planet = "Planet: #{index + 1}. #{planet.name}"
      updated_array << current_planet
    end
    return updated_array
  end

  def add_planet
    puts "Would you like to add a planet to the solar system?"
    puts "Enter yes or no. > "
    answer = gets.chomp.downcase

    if answer == "yes"
      # user_planet = []

      puts "Name your planet"
      name = gets.chomp
      puts "Provide a diameter"
      diameter = gets.chomp.to_i
      puts "Provide a mass"
      mass = gets.chomp.to_i
      puts "Provide the number of moons"
      num_moons = gets.chomp.to_i
      puts "Provide the average temperature"
      avg_temp = gets.chomp.to_i

      # new_planet = Planet.new(name, diameter, mass, num_moons, avg_temp)
      # @planets.push(new_planet)

      @planets << Planet.new(name, diameter, mass, num_moons, avg_temp)
      puts "It's been added!"
    else
      "Don't comprehend."
    end

  end

  def choose_planet
    puts "Would you like to keep learning about this solar system?"
    answer = gets.chomp
    while answer == "yes"
      puts "Please select the planet to learn more. "
      #**-->make selection match the name or number given
      user_selection = gets.chomp.titlecase

      @planets.each do |planet|
        if user_selection == planet.name
          return "\tPlanet: #{planet.name}
          Diameter: #{planet.diameter}
          Mass: #{planet.mass}
          Number of Moons: #{planet.number_moons}
          Average Temperature: #{planet.avg_temp}"
          # elsif user_selection != planet.name
          #    puts "Not finding it..."
        end
      end
    end
  end

  def planet_details
    summary = ""
    @planets.each do |i|
      planet = "\tName: #{i.name}
      Diameter: #{i.diameter}
      Mass: #{i.mass}
      Number of Moons: #{i.number_moons}
      Average Temperature: #{i.avg_temp}\n\n"
      summary << planet
    end
    return summary
  end

end

class Planet
  # allows user to see outside the class
  attr_accessor :name, :diameter, :mass, :number_moons, :avg_temp, :planet_factoids

  # has an initialize that takes 5 parameters
  def initialize(name, diameter, mass, number_moons, avg_temp)
    @name = name
    @diameter = diameter
    @mass = mass
    @number_moons = number_moons
    @avg_temp = avg_temp
  end

  def planet_factoids
    return "\t\tName: #{@name}
    Diameter: #{@diameter}
    Mass: #{@mass}
    Number of moons: #{@number_moons}
    Average temperature: #{@avg_temp}"
  end

end

# --------------------------------WAVE 1:---------------------------------#
# -------everything below can be passed as one thing, or array------------#
# planet_a = {name: "Mercury", diameter: 90, mass: 2, number_moons: 3, avg_temp: 4}
# planet_b = {name: "Venus", diameter: 757, mass: 2, number_moons: 3, avg_temp: 4}
# planet_c = {name: "Earth", diameter: 21, mass: 2, number_moons: 3, avg_temp: 4}
# planet_d = {name: "Mars", diameter: 61, mass: 2, number_moons: 3, avg_temp: 4}
# planet_e = {name: "Jupiter", diameter: 5551, mass: 2, number_moons: 3, avg_temp: 4}
# planet_f = {name: "Hoth", diameter: 1343, mass: 2, number_moons: 3, avg_temp: 4}

# my_solar_system = SolarSystem.new([planet_a, planet_b, planet_c, planet_d, planet_e, planet_f])

# puts my_solar_system.planet_list
# puts my_solar_system.choose_planet

# --------------------------------WAVE 2/3:---------------------------------#
# Make your SolarSystem class take an array of Planets instead of hashes.
# When printing the planet list or planet details, it should call the corresponding method in Planet.
planet_a = Planet.new("Mercury", 90, 2, 3, 4)
planet_b = Planet.new("Venus", 757, 2, 3,4)
planet_c = Planet.new("Earth", 21, 2, 3, 4)
planet_d = Planet.new("Mars", 61, 2, 3, 4)
planet_e = Planet.new("Jupiter", 5551, 2, 3, 4)
planet_f = Planet.new("Hoth", 1343, 2, 3, 4)

new_system = [planet_a, planet_b, planet_c, planet_d, planet_e, planet_f]

my_solar_system = SolarSystem.new(new_system)

puts my_solar_system.planet_list
puts my_solar_system.add_planet
puts my_solar_system.updated_list
puts my_solar_system.choose_planet
# puts my_solar_system.planet_details
