class SolarSystem

  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  # method that returns the array as a string
  def list
    list = ""
    i = 0
    @planets.each do |planet|
      list << "Planet ##{i+1} - \n#{planet.attributes}\n"
      i += 1
    end
    return list
  end

end

class Planet

  attr_accessor :names, :sizes, :colors, :temps, :speeds, :year_length, :distances

  # initialize method which takes several arguments
  def initialize(name, size, color, temp, speed, year_length, distance)
    @names = name
    @sizes = size
    @colors = color
    @temps = temp
    @speeds = speed
    @year_length = year_length
    @distances = distance
    # @@array << self
  end

  # method that returns the Planet's attributes reading the instance variables
  def attributes
    list = "name: #{@names}
    size: #{@sizes} miles in diameter
    color: #{@colors}
    tempuratur: #{@temps} degrees Fahrenheit
    speed: #{@speeds} mph
    year_length: #{@year_length} days to go around the sun
    distance: #{@distances} million miles from the sun"
    return list
  end

end

# creating instance for each planet as an Planet object
planet_a = Planet.new("Mercury", 1516, "dark gray", 332, 112000, 87.97, 36)
planet_b = Planet.new("Jupiter", 43441, "dark orange", -234, 47051, 4332.82, 483)
planet_c = Planet.new("Mars", 4222, "golden brown", -80, 86871, 686.98, 141)
planet_d = Planet.new("Venus", 3760, "light yellow", 864, 78341, 224.70, 67)
planet_e = Planet.new("Earth", 8000, "blue", 61, 67000, 365.26, 93)

# creating an array of planets
my_planets = [planet_a, planet_b, planet_c, planet_d, planet_e]

# calling an intance of SolarSystem class
my_solar_system = SolarSystem.new(my_planets)
the_list_to_print = my_solar_system.list
puts the_list_to_print
