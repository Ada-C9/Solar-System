# class for solarsystem that can contain mulitple planets
class SolarSystem

  attr_accessor :planets

  def initialize(planet_names)
    @planets = planet_names
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def planets_listed
    n = 1
    listed_planets = ""
    @planets.each do |planet|
      listed_planets += "#{n}.\t #{planet.name}\n"
      n += 1
    end
    return listed_planets
  end

  def return_specific_planet(planet_num)
    return @planets[planet_num -1]
  end
end

# class for planet that sets up a new planet
class Planet
  attr_reader :name, :terraform_state, :temperature, :atmosphere, :location

  def initialize(name, terraform_state, temperature, atmosphere, location)
    @name = name
    @terraform_state = terraform_state
    @temperature = temperature
    @atmosphere = atmosphere
    @location = location
  end

  # Array style of returning planet info
  def return_planet
    terrraform_info = ""
    if @terraform_state
      terrraform_info = "Additionally, it has been terraformed."
    else
      terrraform_info = "Additionally, it has not been terraformed."
    end
    planet_info = "#{@name} is a planet located in the #{@location} galaxy. It is a #{@temperature} planet, whose atmosphere is #{@atmosphere} to humans. #{terrraform_info}"
    return planet_info
  end
end
# Hard coded data that pre-populates solar system

venus = Planet.new("Venus", false, "hot", "unbreathable", "Milky Way")

jupiter = Planet.new("Mercury", false, "hot", "unbreathable", "Milk Way")

pluto = Planet.new("Pluto", false, "hot", "unbreathable", "Milky Way")

planet_list = [
  venus,
  jupiter,
  pluto
  ]

# initializes solar system
my_solar_system = SolarSystem.new(planet_list)

puts "Welcome to the Solar System 2000, where you can learn information about the planets in the database or you can add in your own planets!"

puts "What would you like to do? If you want to examine the planets that already are in the system, type 'See Planets'. If you want to add a planet, type 'Add Planet'. If at any point you wish to quit the program, type 'exit'."

user_decision = gets.chomp.upcase

until user_decision == "SEE PLANETS" || user_decision == "ADD PLANET"
  puts "Oops! That's not one of the options I can perform. Please enter 'See Planets' or 'Add Planet'. If at any point you wish to quit the program, type 'exit'."
  user_decision = gets.chomp.upcase
end

if user_decision == "SEE PLANETS"
  puts "Here's a list of the planets in our solar system.\n#{my_solar_system.planets_listed}\n Please type the number of the planet you would like to learn about:"
  planet_selection_num = gets.chomp.to_i
  # Assuming reliable input that matches a listed planet #, will update to validate user input time permitting
  puts my_solar_system.return_specific_planet(planet_selection_num).return_planet
else
  puts "In order to create a new planet, you'll need to enter in some information. What is the planet's name?"
  new_planet_name = gets.chomp
  puts "Has this planet been terraformed? Please enter true or false:"
  new_planet_terraform_state = gets.chomp
  # Assuming reliable input of either "true" or "false", will update to validate user input time permitting
  if new_planet_terraform_state == "true"
    new_planet_terraform_state = true
  else
    new_planet_terraform_state = false
  end
  puts "Does the planet have a cold, temperate or hot temperature?"
  new_planet_temperature = gets.chomp
  # Assuming reliable input of either "cold", "temperate" or "hot", will update to validate user input time permitting
  puts "Is the atmosphere breathable or unbreathable?"
  new_planet_atmosphere = gets.chomp
  # Assuming reliable input of either "breathable" or "unbreathable", will update to validate user input time permitting
  puts "Which galaxy is the planet located in?"
  new_planet_location = gets.chomp

  new_planet_name = Planet.new("#{new_planet_name}", new_planet_terraform_state, "#{new_planet_temperature}", "#{new_planet_atmosphere}", "#{new_planet_location}")

  my_solar_system.add_planet(Planet.new("#{new_planet_name}", new_planet_terraform_state, "#{new_planet_temperature}", "#{new_planet_atmosphere}", "#{new_planet_location}"))

  puts "You just added #{new_planet_name} as a planet, which located in the #{new_planet_location} galaxy. It is a #{new_planet_temperature} planet, whose atmosphere is #{new_planet_atmosphere} to humans."
end
