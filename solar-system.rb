#defines class solarsystem
class SolarSystem


 #helper method for @ planets, allows us to set and get @planets variable
 attr_reader :planets
 attr_accessor :planets_array
 attr_accessor :user_planet

#initialize method, will make it so calling an instance of SolarSystem class
#requires the attribute initial_planets
def initialize(initial_planets)
    #instance variable @planets
    @planets = initial_planets
  end


 def solarsystem_age
   print "This Solar System is 4 days old."
 end
  # a summary method so that we can see what is going on with the
  #instance variable
  def summary
    return "#{@planets}"
  end


  #method that prints out the instance variable as a list
  def list_planets
    n = 1
    planets_array = []
    #adds each instance of planet class to an array
    @planets.each do |planet| #an instance of Planet class
         planets_array << "#{n}.    #{planet.planet_name}"
         #this is using the get method for planet to return the planet name
         #as defined in the initialize
         n += 1
    end
    #retunrs the planets array
    return planets_array
  end

  #adds a planet to the instance variable of planets through user input
  def add_planet
     #allows user to input stats about the planet
     print "What is the name of the new planet?"
     planet_name = $stdin.gets.chomp.to_s
     print "What is the diameter of the planet?"
     planet_diameter = $stdin.gets.chomp.to_s
     print "What is the mass of the planet relative to earth?"
     mass_earth = $stdin.gets.chomp.to_i
     print "How many moons does the planet have?"
     number_of_moons = $stdin.gets.chomp.to_i
     print "How many millions of kilometers is the planet from the sun?"
     distance_from_the_sun = $stdin.gets.chomp.to_i
     print "How long is it's year, relative to an earth year?"
     earth_year = $stdin.gets.chomp.to_f


     #creates a new instance of the planet and adds it to
     #instance variable of Solar System class planets as a class of Planet
     user_input_planet = Planet.new(planet_name,planet_diameter,mass_earth,number_of_moons, distance_from_the_sun, earth_year)
       @planets.push(user_input_planet)

     # the user can choose what step is next after adding a planet
     user_choice
  end

#lists all planets that are available, and let's the user choose a planet
#to read about
  def user_choice
     #for some reason list_planets would only work with a puts command
     puts list_planets
    print "This a list of possible planets.\n"

    print
    #user chooses planet
    print "Please type the name of the planet you would like to read about.\n"
    user_planet = $stdin.gets.chomp.strip

    #for each element in @planets instance variable
    #prints out a string with the pertinent information
    @planets.each do |planet|
        if planet.planet_name == user_planet
          print "The planet named #{planet.planet_name} , is #{planet.planet_diameter} in diameter, has a mass #{planet.mass_earth} times relative to earth, #{planet.number_of_moons} moons, is #{planet.distance_from_the_sun} million kilometers from the sun, and has a year that is #{planet.earth_year} the length of a year on earth.\n"
        end
    end

    #after choice has been made, allows user to pick to continue program
    #add a planet to the solarsyste or exit the program
    print "Would you:
    A: Like to learn about a planet
    B: Create a planet
    C: Find the distance of two planets from each other
    D: Exit\n"
    user_answer = $stdin.gets.chomp.downcase

    #allows user to learn about more planets
    #the planet name can not start with a for this to work
    if user_answer.include? "a"
        user_choice
    #allows user to add a planet
    elsif user_answer.include? "b"
        add_planet
    elsif user_answer.include? "c"
        distance_from_each_other
    else
      exit
    end
  end

  #this determines how far two planets are from each other
  def distance_from_each_other
      total = 0
      #finds which two planets they want to find the distance of
      print "Which two planets do you want to know the distance between?\n"
      print "Planet 1\n"
      planet1 = $stdin.gets.chomp.to_s.strip
      print "Planet 2\n"
      planet2 =$stdin.gets.chomp.to_s.strip

      planet1_equation = 0
      planet2_equation = 0
      #goes through each loop to find the names of the planets
      #and assign them to variables
      @planets.each do |planet|
          if planet.planet_name == planet1
            planet1_equation = planet.distance_from_the_sun
          end
        end

        @planets.each do |planet|
          if
            planet.planet_name == planet2
            planet2_equation = planet.distance_from_the_sun
          end
        end

        #creates the equation and finds the distance of the two planets
          total = planet1_equation - planet2_equation
          total = total.abs
          print "#{planet1_equation} - #{planet2_equation} = #{total}km"
          print "The total distance from #{planet1} and #{planet2} is #{total} millioin kilometers.\n"
  user_choice
  end


end

#this is the planet class
class Planet

  #read/write methods for instance variables of Planet class
  attr_accessor :planet_name
  attr_accessor :planet_diameter
  attr_accessor :mass_earth
  attr_accessor :number_of_moons
  attr_accessor :distance_from_the_sun
  attr_accessor :earth_year


#initialize method which requires a number of instance
#variables for each instance of the planet class
  def initialize(planet_name, planet_diameter, mass_earth, number_of_moons, distance_from_the_sun, earth_year)
    @planet_name = planet_name
    @planet_diameter = planet_diameter
    @mass_earth = mass_earth
    @number_of_moons = number_of_moons
    @distance_from_the_sun = distance_from_the_sun
    @earth_year = earth_year
  end

#this is a summary method for the Planet class
# it was to keep an eye on the instance variables and see how
#they change
 def summary
  return "This is planet #{@planet_name}.
          The diameter is #{@planet_diameter}.
          #{@planet_name}'s mass relative to earth is #{@mass_earth}.
          It has #{@number_of_moons} moons."
 end
end

#creates two instances of Planet class
another_planet = Planet.new("Dis", "40000 km", 5, 44, 30000, 0.45)
planet_instance = Planet.new("Nameo", "300000 km", 1.5, 33, 40000, 6.45)


#calls an instance of SolarSystem class
#inputting our planetst that we had called earlier into it
planet_array = [another_planet, planet_instance]
solarsystem = SolarSystem.new(planet_array)



#starts the program
puts solarsystem.user_choice
