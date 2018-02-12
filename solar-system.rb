
##################### WAVE 1 PART 1 #####################
#
# class SolarSystem
#
#   attr_accessor :planets
#
#   def initialize(input_planets)
#     @planets = input_planets
#   end
#
#     # def planet_name
#     #   return @planets
#     # end
#     #
#     # def planet_name= (new_planet)
#     #   @planets = new_planet
#     # end
#
#     def summary
#       count = 0
#       list = ""
#       @planets.each do |planet|
#         count += 1
#        list << ("#{count}. #{planet} \n")
#            end
#       return list
#     end
# end
#
# angelas_solar_system = SolarSystem.new(["Earth", "Endor", "Hoth", "Naboo", "Tatooine",
#    "Jaku", "Kamino"])
#
# print angelas_solar_system.summary

# ############### WAVE 1 PART 2 ##################
#
# class SolarSystem
#
#   attr_accessor :planets
#
#   def initialize(input_planets)
#     @planets = input_planets
#   end
#
#     def summary
#       planet_info = []
#       @planets.each do |planet|
#         planet.each do |name, attributes|
#           planet_info << ("#{name}: #{attributes} \n\n")
#            end
#          end
#     return planet_info
#   end
# end
#
# angelas_solar_system = SolarSystem.new(
#  [{:Earth => {
#       :color => "blue",
#       :temp => 281,
#       :size => "big",
#       :diameter => 12563,
#       :rule => "resistance"}
#       },
# {:Endor => {
#     :color => "green",
#     :temp => 281,
#     :size => "small",
#     :diameter => 4530,
#     :rule => "resistance"}
# },
# { :Hoth => {
#     :color => "white",
#     :temp => 197,
#     :size => "small",
#     :diameter => 8763,
#     :rule => "first order"}
# },
# { :Naboo => {
#     :color => "gree",
#     :temp => 281,
#     :size => "big",
#     :diameter => 14563,
#     :rule => "resistance"}
# }])
#
# puts angelas_solar_system.summary

######### WAVE 2 ############

# # Create a Planet class which will represent a planet.
# # Add an initialize method which takes several arguments and uses them to set the class' instance variables.
# # Create a method that returns the Planet's attributes in an easy to read fashion.
# # Create reader methods to give a user access to read the instance variables.
# # Make your SolarSystem class take an array of Planets instead of hashes.
# # When printing the planet list or planet details, it should call the corresponding method in Planet.
#
#
# class SolarSystem
#
#   attr_accessor :planets
#
#   def initialize(input_planets)
#     @planets = input_planets
#
#     # ## optional
#     # one_instance_of_a_planet = @planets[0]
#     # one_instance_of_a_planet.print_out
#   end
#
#   def summary
#     planet_info = []
#     @planets.each do |planet|
#         planet_info << ("#{planet.print_out}")
#       end
#     return planet_info
#   end
#
# end
#
# class Planet
#
#   attr_reader   :name, :distance_from_core, :native_species, :moons, :primary_export
#
#   def initialize(name, distance_from_core, native_species, moons, primary_export)
#     @name = name
#     @distance_from_core = distance_from_core #in light years
#     @native_species = native_species
#     @moons = moons
#     @primary_export = primary_export
#   end
#
#   #method prints out all info about given planet:
#   def print_out
#     return "✳︎ #{@name} ✳︎\n" +
#    " ⭐︎ #{@name} is #{@distance_from_core} light years away from core.\n" +
#    " ⭐︎ The native species of #{@name} are #{@native_species}.\n" +
#    " ⭐︎ #{@name} has #{@moons} moons.\n" +
#    " ⭐︎ #{@name}'s primary export: #{@primary_export}.\n\n"
#     end
#
# end
#
# #array of planets that will go through Planet class
# #name, distance from core, native species, # of moons, primary export
#
# planet_array = [
#   Planet.new("Endor", 16000, "Ewoks", 0, "Medicinals"),
#   Planet.new("Alderaan", 5000, "Killiks", 1, "Wine & Art"),
#   Planet.new("Coruscant", 10000, "Humans/Zhell", 4,"None - governing body"),
#   Planet.new("Jakku", 240000, "Teedus", 1, "Bezorite & junk metal"),
#   Planet.new("Hoth", 50200, "Skels", 3, "Ice")
# ]
#
#
# # planet_array.each do |planet_info|
# #   puts planet_info.print_out
# # end
#
# #long way:
# # puts planet_array[0].print_out
# # puts planet_array[1].print_out
# # puts planet_array[2].print_out
# # puts planet_array[3].print_out
# # puts planet_array[4].print_out
#
#
# star_wars_solar_system = SolarSystem.new(planet_array)
#
# puts star_wars_solar_system.summary

################### WAVE 3 ########################


class SolarSystem

  attr_accessor :planets

  def initialize(input_planets)
    @planets = input_planets
  end

  def summary
    planet_info = []
    @planets.each do |planet|
        planet_info << ("#{planet.print_out}")
      end
    return planet_info
  end

  def planet_names
    planet_names =[]
    @planets.each_with_index do |planet, index|
        planet_names << ("#{index + 1}. #{planet.name}")
      end
    return planet_names
  end

  def add_planet(new_planet)
    @planets.push(new_planet)
  end

end

class Planet

  attr_reader   :name, :distance_from_core, :native_species, :moons, :primary_export

  def initialize(name, distance_from_core, native_species, moons, primary_export)
    @name = name
    @distance_from_core = distance_from_core #in light years
    @native_species = native_species
    @moons = moons
    @primary_export = primary_export
  end

  # method prints out all info about given planet:
  def print_out
    return "\n✳︎ #{@name.upcase} ✳︎\n" +
   " ⭐︎ #{@name} is #{@distance_from_core} light years away from core.\n" +
   " ⭐︎ The native species of #{@name} are #{@native_species}.\n" +
   " ⭐︎ #{@name} has #{@moons} moons.\n" +
   " ⭐︎ #{@name}'s primary export: #{@primary_export}.\n"
  end

end
# end of Planet Class

# method to get user input to create a new planets

def create_planet
  puts "\n⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎\n\n"
  puts "You are adding a planet to the Star Wars System!\n\n"
  puts "What is the name of the planet?"
  name = gets.chomp
  puts "How many light years from the core is it?"
  distance_from_core = gets.chomp.to_i
  puts "What is #{name}'s native species?"
  native_species = gets.chomp
  puts "How many moons does #{name} have?"
  moons = gets.chomp.to_i
  puts "What is the primary export?"
  primary_export = gets.chomp

  new_planet = Planet.new(name, distance_from_core, native_species, moons, primary_export)
  puts "⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎"
  puts "Here is a review of the new planet: "
  puts new_planet.print_out

  return new_planet
end


# method to choose planet to learn about

def user_interface(solar_system)
  puts "⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎Welcome to a Star Wars Solar System⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎\n\n"
  puts "The Planets of Star Wars selections:\n\n"
  puts solar_system.planet_names
  puts "#{solar_system.planets.length + 1}. Add another planet"
  puts "#{solar_system.planets.length + 2}. Exit\n\n"

  print "Enter number of choice: "
  user_choice = gets.chomp.to_i

  # Until the user picks "Exit"'s number
  until user_choice == solar_system.planets.length + 2
    # If user picks a valid number
    if(user_choice >= 1 && user_choice <= solar_system.planets.length)
      puts solar_system.planets[user_choice - 1].print_out
      puts "\nWould you like to learn more about the other planets? "
      print "Please enter another number of your choice: "
    elsif user_choice == (solar_system.planets.length + 1)
      new_planet = create_planet
      solar_system.add_planet(new_planet)
      puts "⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎"
      puts "\n\Here is the updated Planet List:"
      puts solar_system.planet_names
      puts "#{solar_system.planets.length + 1}. Add another planet"
      puts "#{solar_system.planets.length + 2}. Exit\n\n"
      puts "⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎"
      puts "\nWould you like to learn more about the other planets? "
      print "Please enter another number of your choice: "
    else
      print "\nThat's an invalid value. Please enter a number between 1 and #{solar_system.planets.length + 2}: "
    end
    user_choice = gets.chomp.to_i
  end
  puts "\n\nThanks for reviewing Star Wars planets...ya nerd!"
  puts "⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎\n"
end




#array of planets that will go through Planet class
#name, distance from core, native species, # of moons, primary export

planet_array = [
  Planet.new("Endor", 16000, "Ewoks", 0, "Medicinals"),
  Planet.new("Alderaan", 5000, "Killiks", 1, "Wine & Art"),
  Planet.new("Coruscant", 10000, "Humans/Zhell", 4,"None - governing body"),
  Planet.new("Jakku", 240000, "Teedus", 1, "Bezorite & junk metal"),
  Planet.new("Hoth", 50200, "Skels", 3, "Ice")
  ]


star_wars_solar_system = SolarSystem.new(planet_array)

user_interface(star_wars_solar_system)
