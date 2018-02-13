#Solar System Homework

class Planet
  attr_reader :p_name, :p_yr_length, :p_dist_sun, :p_num_moons, :p_avg_temp, :p_planet_type, :p_life

  def initialize(name, yr_length, dist_sun, num_moons, avg_temp, planet_type, life)
    @p_name = name
    @p_yr_length = yr_length
    @p_dist_sun = dist_sun
    @p_num_moons = num_moons
    @p_avg_temp = avg_temp
    @p_planet_type = planet_type
    @p_life = life
  end

  #method that returns planet attributes
  def list_planet_attr
    attributes = "Name: #{@p_name}\nPlanet Year Length: #{@p_yr_length}\nDistance to Sun: #{@p_dist_sun}\nNumber of Moons: #{@p_num_moons}\nAverage Temp: #{@p_avg_temp}\nPlanet Type: #{@p_planet_type}\nLife?: #{@p_life}\n"
    return attributes
  end
end

class SolarSystem
  def initialize(all_planets)
    @planets = all_planets
  end

  #add planet method
  def add_planet(new_planet)
    @planets.push(new_planet)
  end

  #method that returns the names of all the planets in solar_sys
  def list_planets
    list = []
    @planets.each do |planet|
      list << "#{@planets.index(planet) + 1}. #{planet.p_name}"
    end
    return list.join("\n")
  end

  #method that returns names & attributes of all the planets in solar_sys
  def list_planets_attributes
    list = []
    #iterate through @planets variable and formats into string
    @planets.each do |planet|
      list << "#{@planets.index(planet) + 1}. #{planet.list_planet_attr}"
    end
    return list.join("\n")
  end
end

#checks user input until valid
def get_input(planet_strings, solar_sys)
  input = gets.chomp.downcase
  until planet_strings.include?(input) || input == "add" || input == "exit"
    puts "\nInvalid input. Please type a planet name, add, or exit."
    puts "#{solar_sys.list_planets}"
    input = gets.chomp.downcase
  end
  return input
end

#makes a new planet from user input
def make_planet
  puts "What is the name of planet? "
  new_planet_name = gets.chomp.to_s

  puts "What is the year length (time to orbit sun) in days on #{new_planet_name}?"
  new_planet_yr_length = gets.chomp.to_s

  puts "What is the distance to the sum from #{new_planet_name}?"
  new_planet_dist_sun = gets.chomp.to_s

  puts "How many moons orbit #{new_planet_name}?"
  new_planet_num_moons = gets.chomp.to_s

  puts "What is the average temperature on #{new_planet_name}?"
  new_planet_avg_temp = gets.chomp.to_s

  puts "What type of planet is #{new_planet_name}?"
  new_planet_type = gets.chomp.to_s

  puts "Is there life on #{new_planet_name}?"
  new_planet_life = gets.chomp.to_s

  new_planet_name = Planet.new(new_planet_name, new_planet_yr_length, new_planet_dist_sun, new_planet_num_moons, new_planet_avg_temp, new_planet_type, new_planet_life)

  return new_planet_name
end


#WAVE 1 TESTS
# planets = %w[Mercury Venus Earth Mars Jupiter Hoth]
# test = SolarSystem.new(planets)
# puts "#{test.list_planets}"
# test.add_planet("Pluto")
# puts "\n#{test.list_planets}"

#year_length => Earth days
#dist_sun => millions or billions of miles
#average_temp => degrees F

# mercury = { name: "Mercury", yr_length: "88", dist_sun: "36m", num_moons: "0", avg_temp: "332", planet_type: "Terrestrial", life: "no"}

#hardcoded planets in solar_sys
mercury = Planet.new("Mercury","88 Earth days","36 million miles","0","332 F","Terrestrial","No")
venus = Planet.new("Venus","225 Earth days","67 million miles","0","864 F","Terrestrial","No")
neptune = Planet.new("Neptune", "60190 Earth days", "2.8 billion miles", "13", "-353 F", "Ice Giant", "No")

#creates an array of strings from the array of planet instances
planet_strings = []
planet_array = [mercury, venus, neptune]
planet_array.each do |planet|
  planet_strings << planet.p_name.downcase
end

#creates solar_sys class from array of planet class instances
solar_sys= SolarSystem.new(planet_array)

#gives users input options
puts "\n✨ ✨ ✨ Welcome to the Milky Way! ✨ ✨ ✨\nThe current planets in the Milky Way are:\n"
puts "#{solar_sys.list_planets}"
puts "\nTo learn about a planet, type the planet name. To add a planet, type ADD. To exit this program, type exit."

# exit_program = false

valid_user_input = get_input(planet_strings,solar_sys)
while true
  if valid_user_input == "exit"
    puts "\n🚀 🚀 🚀 You are now leaving the Milky Way! Safe travels! 🚀 🚀 🚀"
    exit
  elsif valid_user_input == "add"
    #make_planet returns a new instance of the Planet class
    planet_array.push(make_planet)
    #the initial solar_sys varible is overwritten with the new array of planets
    solar_sys= SolarSystem.new(planet_array)
    planet_strings = []
    planet_array.each do |planet|
      planet_strings << planet.p_name.downcase
    end
    class_index = planet_strings.index(planet_strings[-1])
    puts "\n🛰️  🛰️  🛰️  You added a planet!! 🛰️  🛰️  🛰  ️\n#{planet_array[class_index].list_planet_attr}"
  else
    #the attributes of the selected planet is displayed
    class_index = planet_strings.index(valid_user_input)
    input = planet_array[class_index]
    puts "\n#{input.list_planet_attr}"
  end

  #user is brought back to the beginning prompt & given the chance to view, add, or exit
  puts "\nThe planets currently in the Milky Way are: "
  puts "#{solar_sys.list_planets}"
  puts "\nTo learn about a planet, type the planet name. To add a planet, type ADD. To exit this program, type exit."
  valid_user_input = get_input(planet_strings,solar_sys)
end
