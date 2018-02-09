# Define class SolarSystem
class SolarSystem
  attr_accessor :planets

  def initialize planet_list
    @planets = planet_list
  end

  def add new_planet
    @planets << new_planet
  end

  #
  def summary
    summary = "======Summary======\n"
    @planets.each { |key, value|
      summary += "#{key}: \n\tyear_length - #{value[:year_length]} days\n\tdistance_from_the_sun - #{value[:distance_from_the_sun]} km\n\tdiameter - #{value[:diameter]} km\n\tmass - #{value[:mass]} kg\n\tmoons - #{value[:moons]} \n"
    }
    return summary
  end

  def info planet_name
     info_message = "#{planet_name}: \n\tyear_length - #{@planets[planet_name][:year_length]} days\n\tdistance_from_the_sun - #{@planets[planet_name][:distance_from_the_sun]} km\n\tdiameter - #{@planets[planet_name][:diameter]} km\n\tmass - #{@planets[planet_name][:mass]} kg\n\tmoons - #{@planets[planet_name][:moons]} \n"
     return info_message
  end

end

# Hard-coded data
planets = {
  "Mercury" => {
    year_length: 88,
    distance_from_the_sun: 57909227,
    diameter: 4879,
    mass: "3.30 x 10^23",
    moons: 0
  },
  "Venus" => {
    year_length: 225,
    distance_from_the_sun: 108209475,
    diameter: 12104,
    mass: "4.87 x 10^24",
    moons: 0
  },
  "Earth" => {
    year_length: 365.24,
    distance_from_the_sun: 149598262,
    diameter: 12714,
    mass: "5.97 x 10^24",
    moons: 1
  }
}

# Instruction
print "Welcome to the Solar System program. Below is a list of my planets. "
puts "Please pick the one you are interested and enter the number before the planet/exit."
my_solar_system = SolarSystem.new(planets)
planet_names = my_solar_system.planets.keys
list_string = ""
planet_names.length.times { |i|
  list_string += "#{i + 1}. #{planet_names[i]}, "
}
list_string += "#{planet_names.length + 1}. exit"
puts list_string

# Helper method to collect and validate user's choice
def collect_and_validate_choice(range)
  choice = gets.chomp.to_i
  until (1..range).include?(choice)
    puts "Please enter a valid choice: "
    choice = gets.chomp.to_i
  end
  return choice
end

# Display information of the chosen planet
user_choice = collect_and_validate_choice(planet_names.length + 1)
until user_choice == (planet_names.length + 1)
  chosen_planet = planet_names[user_choice - 1]
  puts my_solar_system.info(chosen_planet)
  puts "Pick another one if you want. Enter #{planet_names.length + 1} to exit. "
  user_choice = collect_and_validate_choice(planet_names.length + 1)
end

# Output all infomation in the current solar system
puts my_solar_system.summary
