class SolarSystem
  # Helper method w/ @planets instance variable representing the array of planet names (set below)
  attr_accessor :planet_list

  # Constructor (so when you create a new object that is an instance of this class using .new, you will need to include an argument for the list of planet names
  def initialize(planet_list)
    @planet_list = planet_list
  end

  # Add planet to the list
  def add_planet(planet)
    @planet_list << planet
    return @planet_list
  end

  # Method to show the full list of planets
  def list_planets
    list = ""
    num = 1
    @planet_list.each do |planet|
      list += "#{num}. #{planet.planet_name} \n"
      num += 1
    end
    return list
  end
end

class Planet
  # Helper method w/ instance variables representing a given planet's attributes
  attr_accessor :planet_name, :distance_from_the_sun, :diameter, :year_length, :number_of_moons, :random_fact

  # Constructor
  def initialize(planet_name, distance_from_the_sun, diameter, year_length, number_of_moons, random_fact)
    @planet_name = planet_name
    @distance_from_the_sun = distance_from_the_sun
    @diameter = diameter
    @year_length = year_length
    @number_of_moons = number_of_moons
    @random_fact = random_fact
  end

  # Method to return the planets' attributes
  def show_planet_attributes
    return "#{@planet_name}-\n Distance from the Sun: #{@distance_from_the_sun}\n Diameter: #{@diameter}\n Year Length: #{@pyear_length}\n Number of Moons: #{@number_of_moons}\n Random Fact: #{@random_fact}"
  end

end
mercury = Planet.new("Mercury", "57,909,227 km", "4,879 km", "88 days", "none", "Mercury is the closest planet to the sun in our solar system and the smallest in size.")
venus = Planet.new("Venus", "108,209,475 km", "12,104 km", "225 days", "none", "Venus is the hottest planet in our solar system.")
earth = Planet.new("Earth", "149,598,262 km", "12,742 km", "365.24 days", "one (the moon)", "Earth is the only planet in our solar system that supports life... that we know of!")
jupiter = Planet.new("Jupiter", "778,340,821 km", "139,822 km", "11.9 years", "sixty-seven (Io, Europa, Ganymede, Callisto...)", "Jupiter is the largest planet in our solar system.")
mars = Planet.new("Mars", "227,943,824 km", "6,779 km", "1.9 years", "two (Phobos & Deimos)", "Mars is often described as the 'Red Planet' due to its reddish appearance.")

planet_list = [mercury, venus, earth, jupiter, mars]
my_solar_system = SolarSystem.new(planet_list)
loop do
  puts "Welcome to the Solar System Wiki!"
  puts "What would you like to do? (Please select A, B, or C)"
  puts "A. Learn about planets"
  puts "B. Add a new planet to the Wiki"
  puts "C. Exit the Wiki"
  selection = gets.chomp.downcase
  until selection == "a" || selection == "b" || selection == "c"
    puts "Please select A, B, or C"
    selection = gets.chomp
  end

  case selection
  when "A", "a"
    puts "Here are the list of planets in the Wiki."
    puts my_solar_system.list_planets
    puts "Please select the corresponding number to learn more about one of the planets: "
    selected_planet = gets.chomp.to_i
    until selected_planet > 0 && selected_planet <= planet_list.length
      puts "Please select the corresponding number to learn more about one of the planets: "
      puts my_solar_system.list_planets
      selected_planet = gets.chomp.to_i
    end
    puts planet_list[selected_planet-1].show_planet_attributes

  when "B", "b"
    puts "Thank you for contributing to our Wiki!"
    puts "Planet name: "
    new_planet_name = gets.chomp
    puts "Planet diameter: "
    new_planet_diameter = gets.chomp
    puts "Distance from the sun: "
    new_planet_distance = gets.chomp
    puts "Year Length: "
    new_planet_year_length = gets.chomp
    puts "Number of moons: "
    new_planet_number_of_moons = gets.chomp
    puts "Random Fact: "
    new_planet_random_fact = gets.chomp
    planet_list << new_planet_name = Planet.new(new_planet_name.capitalize, new_planet_diameter, new_planet_distance, new_planet_year_length, new_planet_number_of_moons, new_planet_number_of_moons)
    puts planet_list[-1].show_planet_attributes
  else
    puts "Goodbye!"
    exit
  end
end
