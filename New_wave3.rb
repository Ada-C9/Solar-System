#Create Plant class
class Planet
  attr_reader :planet,:desc,:orbit,:diameter,:rotate,:distance
  def initialize(planet,desc,orbit,diameter,rotate,distance)
    @planet = planet
    @desc = desc
    @orbit =orbit
    @diameter=diameter
    @rotate = rotate
    @distance = distance
  end
  def planet_attributes
    attributes = "Planet: #{@planet}\nDesc: #{@desc}\nOrbit: #{@orbit}\nDiameter: #{@diameter}\nYear Length: #{@rotate}\nDistance from Sun: #{@distance}\n"
    return attributes
  end
end

#Create Solar System Class
class SolarSystem
  attr_accessor :planet
  def initialize(planet)
    @planet = planet
  end
  def add_planet(new_planet)
    @planet<<new_planet
  end
  def return_planets
    list_of_planets = []
    @planet.each do |planet|
      list_of_planets << "#{@planet.index(planet)+1}. #{planet}"
    end
    return list_of_planets
  end
  #Calling Planet Class to print attributes from SolarSystem class
  def check
    choice=gets.chomp.to_i
    if choice == 1
      element = Planet.new("Mercury","Smallest planet","47.8km/sec","4878km","87.97days","70millionkm")
      b =element.planet_attributes
      return  b
    elsif choice == 2
      element = Planet.new("Mars","Fourth planet in Solar System","35km/sec","12,100km","243days","108million km")
      b = element.planet_attributes
      return b
    elsif choice == 3
      element = Planet.new("Venus","Second planet in Solar system","70km/sec","11000km","345days","234million km")
      b = element.planet_attributes
      return b
    elsif choice == 4
      element = Planet.new("Earth","Third planet in Solar System","88km/sec","234334km","365days","12million km")
      b = element.planet_attributes
      return b
    end
  end
end
#Method to add new planet from user input
  def create_planet_userinput(new_planet,new_planet_desc,new_planet_orbit,new_planet_diameter,
    new_planet_rotate,new_planet_distance)
    new_element = Planet.new(new_planet,new_planet_desc,new_planet_orbit,new_planet_diameter,
      new_planet_rotate,new_planet_distance)
      return new_element
    end

#Array of planets
    planet_array = %w[Mercury Mars Venus Earth]
    planet_list = SolarSystem.new(planet_array)
#Start of user interface
    print"Welcome to the Solar System\n"
    answer = "y"
    while answer.include?("y")
      print"Select a planet to know the details:\n"
      puts planet_list.return_planets
      puts planet_list.check
      print "Do you know about other planets (y/n)?"
      answer = gets.chomp
    end
    #New planet routine
    print "Do you want to add a new planet (y/n)"
    answer1 = gets.chomp

    if answer1 == "y"
      print "Please enter the planet name"
      new_planet = gets.chomp
      print "Enter the desc"
      new_planet_orbit = gets.chomp
      print"orbit"
      new_planet_desc = gets.chomp
      print "Enter the diameter "
      new_planet_diameter = gets.chomp
      print " orbital speed "
      new_planet_rotate = gets.chomp
      print "enter the distance"
      new_planet_distance = gets.chomp

      new_planet1 = create_planet_userinput(new_planet, new_planet_desc,new_planet_orbit,new_planet_diameter,new_planet_rotate,new_planet_distance)
      print new_planet1.planet_attributes

      planet_array << new_planet
      puts planet_list.return_planets
      #print planet_list
    elsif answer1 == "n"
      print "Thanks for looking"

    end
