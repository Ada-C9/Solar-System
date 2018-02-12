require 'pry'
class SolarSystem
  attr_accessor :planets #reads and writes to @planets instance variable

  def initialize(list_of_planets) #instantiates new instance with planet names
    @planets = list_of_planets
  end


  def add_planet(planet_object)# add new planet name to @planets array
    @planets << Planet.new(planet_object)
  end

  def list_planets # lists the planets in the solar system with a number in front, ex: 1. Venus
    info = ""
    i = 0
    @planets.each do |planet|
      info += "#{i += 1}. #{planet.name}\n"
    end
    return info
  end

  def link_planets(select)
    planet_dictionary = Hash[@planets.collect { |planet| [planet.name, planet] } ]
    return planet_dictionary[select]
  end
end

class Planet
  attr_accessor :name, :year_length, :distance_from_the_sun, :diameter, :mass, :mass_compared_to_earth, :moons, :surface_temp, :first_record, :recorded_by #reads and writes to instance variables for each planet

  def initialize(info) # initialize argument uses hash to populate instance variables
    @name = info[:name]
    @year_length = info[:year_length]
    @distance_from_the_sun = info[:distance_from_the_sun]
    @diameter = info[:diameter]
    @mass = info[:mass]
    @mass_compared_to_earth = info[:mass_compared_to_earth]
    @moons = info[:moons]
    @surface_temp = info[:surface_temp]
    @first_record = info[:first_record]
    @recorded_by = info[:recorded_by]

  end

  # || taken from here ||
  def summary #There should be a way to format this without copious tabs, but I couldn't find it
    return "\t\t\t\t#{@name}
    ----------------------------------------------------
    Orbit period: \t\t#{@year_length} earth years(#{(@year_length * 365.25).round(2)} earth days)
    Orbit distance: \t\t#{(@distance_from_the_sun * 149597870.7).round(2)} km (#{@distance_from_the_sun} AU)
    Diameter: \t\t\t#{@diameter}
    Mass: \t\t\t#{@mass} (#{@mass_compared_to_earth * 100}%)
    Moons: \t\t\t#{@moons}
    Temperature: \t\t#{@surface_temp}
    Historical Record: \t\t#{@first_record}
    Recorded By: \t\t#{@recorded_by}\n\n"
  end
end

#list of hashes to populate the sol solar system
planets = [
  {
    name: "Mercury",
    year_length: 88,
    distance_from_the_sun: 0.39,
    diameter: 4879,
    mass: "3.30 x 10^23 kg",
    mass_compared_to_earth: 0.055,
    moons: "none",
    surface_temp: "-173 to 427°C",
    first_record: "14th century BC",
    recorded_by: "Assyrian astronomers"
  },

  {
    name: "Venus",
    year_length: 225,
    distance_from_the_sun: 0.73,
    diameter: 12104,
    mass: "4.87 x 10^24 kg",
    mass_compared_to_earth: 0.815,
    moons: "none",
    surface_temp: "462 °C",
    first_record: "17th century BC",
    recorded_by: "Babylonian astronomers"
  },

  {
    name: "Earth",
    year_length: 1.0,
    distance_from_the_sun: 1.0,
    diameter: 12742,
    mass: "5.97 x 10^24 kg",
    mass_compared_to_earth: 1.0,
    moons: "The Moon",
    surface_temp: "-88 to 58°C",
    first_record: "12th century AD",
    recorded_by: "John the Good in 'Bible Historiale'"
  },

  {
    name: "Mars",
    year_length: 1.9,
    distance_from_the_sun: 1.38,
    diameter: 6779,
    mass: "6.42 x 10^23 kg",
    mass_compared_to_earth: 10.7,
    moons: "Phobos & Deimos",
    surface_temp: "-153 to 20 °C",
    first_record: "2nd millennium BC",
    recorded_by: "Egyptian astronomers"
  },

  {
    name: "Jupiter",
    year_length: 11.9,
    distance_from_the_sun: 5.2,
    diameter: 139822,
    mass: "1.90 × 10^27 kg",
    mass_compared_to_earth: 318,
    moons: "Io, Europa, Ganymede, Callisto & 63 other satellites",
    surface_temp: "-148 °C",
    first_record: "7th or 8th century BC",
    recorded_by: "Babylonian astronomers"
  },

  {
    name: "Saturn",
    year_length: 29.5,
    distance_from_the_sun: 9.58,
    diameter: 116464,
    mass: "5.68 × 10^26 kg ",
    mass_compared_to_earth: 95,
    moons: "Titan, Enceladus, Iapetus, Rhea & 58 other satellites",
    surface_temp: "-178 °C",
    first_record: "8th century BC",
    recorded_by: "Assyrians"
  },

  {
    name: "Uranus",
    year_length: 84.0,
    distance_from_the_sun: 19.22,
    diameter: 50724,
    mass: "8.68 × 10^25 kg",
    mass_compared_to_earth: 15,
    moons: "Miranda, Titania, Ariel, Umbriel, Oberon & 21 smaller satellites",
    surface_temp: "-216 °C",
    first_record: "March 13th 1781",
    recorded_by: "William Herschel"
  },
  {
    name: "Neptune",
    year_length: 164.8,
    distance_from_the_sun: 30.10,
    diameter: 49244,
    mass: "1.02 × 10^26 kg",
    mass_compared_to_earth: 17,
    moons: "Triton & 13 smaller satellites",
    surface_temp: "-214 °C",
    first_record: "September 23rd 1846",
    recorded_by: "Urbain Le Verrier & Johann Galle"
  },
]

new_planets_attributes = {
  name: "Bob",
  year_length: 188,
  distance_from_the_sun: 30.10,
  diameter: 49244,
  mass: "1.02 × 10^26 kg",
  mass_compared_to_earth: 17,
  moons: "Me, Myself and Aye",
  surface_temp: "-173 to 427°C",
  first_record: "24th century",
  recorded_by: "Time travelors"
}
# empty hash to store new planet objects
planets_to_add = []


# block to create new instances of the planet class and add them to an array
planets.each do |planet|
  planets_to_add << Planet.new(planet)
end

# creates a new instance of the SolarSystem class and populates it with planets from an array
sol = SolarSystem.new(planets_to_add)

# print a lists of planets to the screen
puts "\nPlanet List:\n#{sol.list_planets}"

# ask the user if they want to create a new planet
puts "\nDo you want to add a planet to the solar system?"
new_planet = gets.chomp.downcase

# loop to add new planets
until new_planet == "no"
  # array of questions to ask the user in order to create the new planet - explore if it could be converted to a class method
  new_planet_questions = ["official name", "orbit period", "orbit distance", "diameter", "mass", "moon or satellite", "temperature", "first record of discovery",
    "discoverer"]
    temp_storage = []
    # loop to ask each question in the question array and add them to an empty array

    new_planet_questions.each_with_index do |attribute, index|
      print "\nWhat is your planet's #{attribute}?:  "
      temp_storage[index] = gets.chomp
    end
    # add values from the loop to the correct hash key in new_planets_attributes
    new_planets_attributes[:name] = temp_storage[0]
    new_planets_attributes[:year_length] = temp_storage[1].to_r if temp_storage[1] != ""
    new_planets_attributes[:distance_from_the_sun] = temp_storage[2].to_r if temp_storage[1] != ""
    new_planets_attributes[:diameter] = temp_storage[3].to_r if temp_storage[3] != ""
    new_planets_attributes[:mass] = temp_storage[4].to_r if temp_storage[4] != ""
    temp_storage[4] != "" ? new_planets_attributes[:mass_compared_to_earth] = (temp_storage[4].to_r/(5.97 * 10**24)) : new_planets_attributes[:mass_compared_to_earth] = 1
    new_planets_attributes[:moons] = temp_storage[5] if temp_storage[5] != ""
    new_planets_attributes[:surface_temp] = temp_storage[6] if temp_storage[6] != ""
    new_planets_attributes[:first_record] = temp_storage[7] if temp_storage[7] != ""
    new_planets_attributes[:recorded_by] = temp_storage[8] if temp_storage[8] != ""

    # use the hash to create a new planet instance in our solar system
    sol.add_planet(new_planets_attributes)

    puts "*" * 25

    # ask user if they would like to add another planet or exit the loop
    puts "\nWould you like to add another planet?"
    new_planet = gets.chomp.downcase
  end

# print out an updated list of planets
  puts "\nPlanet List:\n#{sol.list_planets}"

# ask the user if they would like information on a planet
  puts "\nWould you like to learn more about a planet?"
  learn_more = gets.chomp.downcase

# loop to print planet summaries for the user
  until learn_more == "no"
    print "\nTo learn more about a planet, type its name: "
    select = gets.chomp.capitalize
# control for numbers
    case select
    when /\d/
      print "Please enter a planet name: "
      select = gets.chomp.capitalize
      puts "\n"
      puts sol.link_planets(select).summary
    else
      puts "\n"
      puts sol.link_planets(select).summary
    end
  # ask user if they would like more information or to exit the loop
    puts "Would you like to learn more about another planet?"
    learn_more = gets.chomp.downcase
  end

  puts "-" * 20
  puts "Thank you for exploring the Solar System!\n - the program will exit now -"
