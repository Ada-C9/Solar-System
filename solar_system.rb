# WAVE THREE
# Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.
# Allow your user to add their own planet.

class Planet

  def initialize (planets)
    planets.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  attr_accessor :name, :moons, :surface_temp_c, :diameter, :orbit_period, :length_of_day, :distance_from_sun, :all_facts

  def planet_name
      return "The planet name is #{@name}."
  end

  def number_of_moons
    return "#{@name} has #{@moons} moons."
  end

  def surface_temp_c
    return "The suraface temperature of #{@name} is #{@surface_temp_c} degrees celcius."
  end

  def diameter
    return "#{@name} has a diameter of #{@diameter}."
  end

  def orbit_period
    return "The orbit period of #{@name} is #{@orbit_period}."
  end

  def length_of_day
    return "The solar days of #{@name} are #{@length_of_day} long."
  end

  def distance_from_sun
    return "#{@name} is #{@distance_from_sun} from the Sun."
  end

  def all_facts
    return "#{self.planet_name} \n#{self.number_of_moons} \n#{self.surface_temp_c} \n#{self.diameter} \n#{self.orbit_period} \n#{self.length_of_day} \n#{self.distance_from_sun}"
  end

end

class SolarSystem

  def initialize (planets)
    return @planets = planets
  end

  attr_accessor :planets

  def planet
    @planets << Planet.new
  end

  def system
    return "#{@planets}"
  end

  def planet_list
    puts "Our Solary System is made up of the following planets: "
    planet_name = ""
    planet_num = 0
    @planets.each do |planet|
      planet_num += 1
      planet_name << "#{planet_num}. #{planet.name} \n"
    end
    return planet_name
  end

  def planet_facts
    puts "Here are some facts about planets:"
    @planets.each do |planet|
      puts "#{@planets}"
    end
  end

end

planets = []

jupiter = {:name => "Jupiter", :moons => 67, :surface_temp_c => -148, :diameter => "142984 km", :orbit_period => "4333 days", :length_of_day => "10 hours " }
mars = {:name => "Mars", :moons => 2, :surface_temp_c => "-153 to 20" , :diameter => "6792 km", :orbit_period => "687 days", :length_of_day => " 25 hours" }
venus= {:name => "Venus", :moons => 0, :surface_temp_c => 426, :diameter => "12104 km", :orbit_period => "225 days", :length_of_day => "117 earth days"}

planets << Planet.new(jupiter)
planets << Planet.new(mars)
planets << Planet.new(venus)

outer_space = SolarSystem.new(planets)

puts "Welcome the Solar System app!"
puts outer_space.planet_list

interactions = ["EXPLORE","NEW","EXIT"]

run_once = false
interact = ""

until interact == "EXIT"

  # IF this is the first time the user is prompted to enter an action
  # OR they chose a valid options THEN display the regular prompts
  if (run_once == false || interactions.include?(interact))

    if (run_once == false)
      puts "To learn more about a specific planet type: Explore"
      puts "Discovered a new planet? Type: New"
      puts "Had enough? To quit type: Exit"
    else
      puts "What would you like to do (new, explore, exit)?"
    end

  # ELSE the loop has already run and the user supplied invalid input,
  # so we need to prompt them to enter something valid.
  else

    puts "Please enter a valid option."

  end

  interact = gets.chomp.upcase

  run_once = true

  case interact
    when "EXPLORE"
      puts outer_space.planet_list
      puts "Type the number that corresponds to the planet you would like to learn more about:"

      # TO DO: Add a check to ensure they've supplied a valid number

      puts planets[gets.chomp.to_i - 1].all_facts

    when "NEW"
      new_user_planet = {}
      print "What is the planet name? "
      new_user_planet[:name] = gets.chomp.to_s.capitalize
      print "How many moons does the planet have? "
      new_user_planet[:moons] = gets.chomp.to_i
      print "What is the planet's suraface temperature in celcius? "
      new_user_planet[:surface_temp_c] = gets.chomp.to_s
      print "What is the planet's diameter in kilometers? "
      new_user_planet[:diameter] = gets.chomp.to_i
      print "What is the planet's orbit period? "
      new_user_planet[:planet_orbit] = gets.chomp.to_s
      print "How long is the solar day? "
      new_user_planet[:length_of_day] = gets.chomp.to_s
      print "How far away from the sun is the planet? "
      new_user_planet[:distance_from_sun] = gets.chomp.to_s

      planets << Planet.new(new_user_planet)

      puts outer_space.planet_list
  end
end

 puts "Thanks for exploring the solar system, see you next time!"

# Wave two

# Make your SolarSystem class take an array of Planets instead of hashes.
# When printing the planet list or planet details, it should call the corresponding method in Planet.
# planets = []
#
# class Planet
#   def initialize (name, moons, surface_temp_c, diameter, orbit_period, length_of_day, distance_from_sun)
#     @name = name
#     @moons = moons
#     @surface_temp_c = surface_temp_c
#     @diameter = diameter
#     @orbit_period = orbit_period
#     @length_of_day = length_of_day
#     @distance_from_sun = distance_from_sun
#   end
#
#   attr_accessor :name, :moons, :surface_temp_c, :diameter, :orbit_period, :length_of_day, :distance_from_sun, :all_facts
#
#   # def planet_list
#   #   planet_list = []
#   #   @@planets.each do |planet|
#   #     planet_list << planet.name
#   #   end
#   #
#   #   return planet_list
#   #
#   # end
#
#   def planet_name
#       return "The planet name is #{@name}."
#   end
#
#   def number_of_moons
#     return "#{@name} has #{@moons} moons."
#   end
#
#   def surface_temp_c
#     return "The suraface temperature of #{@name} is #{@surface_temp_c} degrees celcius."
#   end
#
#   def diameter
#     return "#{@name} has a diameter of #{@diameter}."
#   end
#
#   def orbit_period
#     return "The orbit period of #{@name} is #{@orbit_period}."
#   end
#
#   def length_of_day
#     return "The solar days of #{@name} are #{@length_of_day} long."
#   end
#
#   def distance_from_sun
#     return "#{@name} is #{@distance_from_sun} from the Sun."
#   end
#
#   def all_facts
#     return "#{self.planet_name} \n\t#{self.number_of_moons} \n\t#{self.surface_temp_c} \n\t#{self.diameter} \n\t#{self.orbit_period} \n\t#{self.length_of_day} \n\t#{self.distance_from_sun}"
#   end
#
# end
# # WAVE one part two
# class SolarSystem
#
#   def initialize (planets)
#     return @planets = planets
#   end
#
#   attr_accessor :planets
#
#   def planet
#     @planets << Planet.new
#   end
#
#   def system
#     return "#{@planets}"
#   end
#
#   def planet_list
#     puts "The planets of outer space: "
#     planet_name = ""
#     planet_num = 0
#     @planets.each do |planet|
#       planet_num += 1
#       planet_name << "#{planet_num}. #{planet.name} \n"
#
#     end
#
#     return planet_name
#   end
#
#   def planet_facts
#     puts "Here are some facts about planets:"
#     @planets.each do |planet|
#       puts "#{@planets}"
#     end
#   end
#
# end
#
#
# jupiter = {:moons => 67, :surface_temp_c => -148, :diameter => "142984 km", :orbit_period => "4333 days", :length_of_day => "10 hours " }
# mars = {:moons => 2, :surface_temp_c => "-153 to 20" , :diameter => "6792 km", :orbit_period => "687 days", :length_of_day => " 25 hours" }
# venus= {:moons => 0, :surface_temp_c => 426, :diameter => "12104 km", :orbit_period => "225 days", :length_of_day => "117 earth days"}
#
# test = Planet.new(jupiter)
#
# # planet_one = {:name => "Jupiter", :moons => 67, :surface_temp_c => -148, :diameter => "142984 km", :orbit_period => "4333 days", :length_of_day => "10 hours ", :distance_from_sun => "483.8 million mi"}
# # planet_two = {:name => "Mars", :moons => 2, :surface_temp_c => "-153 to 20" , :diameter => "6792 km", :orbit_period => "687 days", :length_of_day => " 25 hours", :distance_from_sun =>"141.6 million mi"}
# # planet_three = {:name => "Venus", :moons => 0, :surface_temp_c => 426, :diameter => "12104 km", :orbit_period => "225 days", :length_of_day => "117 earth days", :distance_from_sun => "67.24 million mi"}
#
# planets = []
# planets << Planet.new("Jupiter", 67, -148, "142984 km", "4333 days" , "10 hours", "483.8 million mi")
# planets << Planet.new("Mars", 2, "-153 to 20", "6792 km", "687 days", " 25 hours", "141.6 million mi")
# planets << Planet.new("Venus", 0, 426, "12104 km", "225 days", "117 earth days", "67.24 million mi")
#
# puts planets[0].all_facts
#
# # puts planet_one.name
# # puts planet_two.name
# # puts planet_three.name
# # puts planet_one.number_of_moons
# # puts planet_one.surface_temp_c
# # puts planet_one.diameter
# # puts planet_one.orbit_period
# # puts planet_one.length_of_day
# # puts planet_one.distance_from_sun
# # puts planet_two.number_of_moons
# # puts planet_three.number_of_moons
#
#
# # outer_space = SolarSystem.new([planet_one, planet_two, planet_three])
# outer_space = SolarSystem.new(planets)
# # puts outer_space.planet_list
# ##puts outer_space.system
# puts outer_space.planet_list



# WAVE 1 part one
# Create a SolarSystem class with an @planets instance variable.
# Create an initialize method which should take a collection of
     # planet names and store them in an @planets instance variable.
# Create a method that adds a planet to the list (not using user
    # input).
# Create a method which will return, not print, a list of the
    # planets as a String
#
# class SolarSystem
#
#   def initialize (planets)
#     @planets = planets
#   end
#
#   attr_reader :planets
#
#   # def planet
#   #   @planets << planet
#   # end
# #
# #   def system
# #     return "#{@planets}"
# #   end
# #
# #   def planet_list
# #     puts "The planets of outer space: "
# #     planet_name = ""
# #     planet_num = 0
# #     @planets.each do |planet|
# #       planet_num += 1
# #       planet_name << "#{planet_num}. #{planet} \n"
# #
# #     end
# #     return planet_name
# #   end
# # end
# #
# outer_space = SolarSystem.new(["Pluto", "Mars", "Venus"])
# # puts outer_space.system
# # puts outer_space.planet_list
# # planets_in_outer_space = outer_space.system
# # puts planets_in_outer_space
# #
# # puts "The planets of outer space: "
# # planets_in_outer_space.each do |planet|
# #   puts "#{planet + 1}. #{outer_space.system}"
# # end
