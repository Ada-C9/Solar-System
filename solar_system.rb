
class Planet

  attr_reader :name, :state, :moons, :day_length, :diameter, :star_dist
  def initialize (name, state, moons, day_length, diameter, star_dist)
    @name = name
    @state = state
    @moons = moons
    @day_length = day_length
    @diameter = diameter
    @star_dist = star_dist
  end

  def planet_summary
    summary = "Planet name: #{@name} \n"
    summary << "State: #{@state} \n"
    summary << "\# of Moons: #{@moons} \n"
    summary << "Length of Day(h): #{@day_length} \n"
    summary << "Diameter(km): #{@diameter} \n"
    summary << "Distance from their Star(10^6km): #{@star_dist} \n\n"
    return summary
  end
end#end class Planet

class SolarSystem

  attr_accessor :planet_list # this should be an array of existing planets
  def initialize (solar_system)
    @planet_list = solar_system
  end

  def add_planet (planet)
    @planet_list << planet
  end

  def directory
    value = ""
    @planet_list.each_with_index do |planet,i|
      value += "#{i+1} #{planet.name} \n"
    end
    return value
  end

  def print_planet_info (view_planet)
    print_out = ""
    @planet_list.each_with_index do|planet,i|
      if i == view_planet - 1
        print_out =  "#{planet.planet_summary}"
      end#end if
    end#end loop
    return print_out
  end#end print)planet_info_method
end#end class SolarSystem

def create_planet
  puts "Enter the name of the planet you would like to create: "
  name = gets.chomp.downcase.capitalize
  puts "Enter the state (solid or gaseous) of the planet: "
  state = gets.chomp
  puts "Enter the number of moons orbiting the planet: "
  moons = gets.chomp
  puts "Enter the length of a day in hours on this planet (in hours): "
  day_length = gets.chomp
  puts "Enter the diameter of the planet (in km): "
  diameter = gets.chomp
  puts "Enter the distance to the nearest star (in 10^6km): "
  star_dist = gets.chomp
  new_planet = Planet.new(name,state,moons.to_i,day_length.to_f,diameter.to_f,star_dist.to_f)
  return new_planet
end

mercury = Planet.new("Mercury","solid",0,4222.6,4879,57.9)
venus = Planet.new("Venus", "solid", 0, 2802.0, 12104, 108.2)
earth = Planet.new("Earth", "solid", 1, 24.0, 12756, 149.6)
mars = Planet.new("Mars", "solid", 0, 24.7, 6792, 227.9)
jupiter = Planet.new("Jupiter", "gaseous", 2, 9.9, 142984, 778.6)
saturn = Planet.new("Saturn", "gaseous", 67, 10.7, 120536, 1433.5)
uranus = Planet.new("Uranus", "gaseous",62, 17.2, 51118, 2872.5)
neptune =  Planet.new("Neptune", "gaseous", 27, 16.1, 49528, 4495.1)

solar_system = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
sun = SolarSystem.new(solar_system)


#UI portion---------------------------------------

puts "Hi there! Welcome to the Solar System Program. \n\n"

puts "Planet List \n\n"
puts sun.directory

puts "\nTo learn about a specific planets in the Solar System, \ntype in the number associated with the planet from the list above"
puts "To create your own planet, type 'create'"
puts "If you're done with the program, type 'quit'"
puts "Choice: "
user_choice = gets.chomp

until user_choice == "quit"
  if user_choice == "create"
    sun.add_planet(create_planet)
    value = "New planet created."
  else
    user_choice = user_choice.to_i
    # sun.planet_list.each_with_index do |planet, i|
    value = sun.print_planet_info(user_choice) #if user_choice.to_i == i + 1
  end#end if loop

  puts value
  puts "\n\nPlanet List \n\n"
  puts sun.directory
  puts "\nTo learn about a specific planets in the Solar System, \ntype in the number associated with the planet from the list above"
  puts "To create your own planet, type 'create'"
  puts "If you're done with the program, type 'quit'"
  puts "New Choice: "
  user_choice = gets.chomp
end#end until loop
