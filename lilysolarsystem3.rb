#Lily Solar System: Wave III

#Create planet class with specified information for all planets
class Planet
  attr_accessor :name, :gname, :moon, :au

  def initialize(planet_name, planet_gname, planet_moon, planet_au)
    @name = planet_name
    @gname = planet_gname
    @moon = planet_moon
    @au = planet_au
  end
end

#Create overarching solar system class with planets as the instance variable
class SolarSystem
  attr_accessor :planets

  def initialize(planet_list)
    @planets = planet_list
  end

  #Create a method that will iterate through the instance variables and put them in an array with numbers for a tidy return
  def contents
    names = []
    i = 1
    @planets.each do |planet|
      names << "#{i}. #{planet.name}"
      i += 1
    end
    puts names

  end

  #Create a method to make a new planet from user input and include new planet with existing planets
  def create_planet
    user_planet = Array.new
    puts "\nWhat luck, we can make a new planet just for you!"
    puts "\nTo add your new planet please respond to the following prompts: "
    print "\nName: "
      name = gets.chomp.to_s
      user_planet.push(name)
    print "Greek name: "
      gname = gets.chomp.to_s
      user_planet.push(gname)
    print "Number of moons: "
      moon = gets.chomp.to_i
      user_planet.push(moon)
    print "Distance from sun in AU: "
      au = gets.chomp.to_f
      user_planet.push(au)

    @planets << Planet.new(*user_planet)

    puts "\nHere is your new planet: " + "\nName: " + user_planet[0] + "\nGreek name: " + user_planet[1] + "\nNumber of moons: " + user_planet[2].to_s + "\nDistance from the sun: " + user_planet[3].to_s + " A.U.\n "

    puts "\nHmmm would you like to do more?"
    playgame
  end

  #Create a method to show list of planets and provide user-prompted data
  def library
    puts "\nExcellent, which planet would you like to learn more about?"
    puts "Here are your choices: "

    contents

    print "\nPlease type the number of your choice and hit enter: "
    chosen_planet = gets.chomp.to_i

    @planets.each_with_index do |planet, i|
      if chosen_planet-1 == i
        puts "\nMore information on " + planet.name + ":"
        puts "Greek name: " + planet.gname + "\nNumber of moons: " + planet.moon.to_s + "\nDistance from the sun: " + planet.au.to_s + "A.U.\n "
      end
    end
    puts "Hmmm...would you like to do more?"
    playgame
  end

  def playgame
    puts "✨ Here are your options: \nA. See about a planet \nB. Add a new one? \nC. Exit"
    print "\nPlease select the letter of your choice: "
    agenda = gets.chomp.downcase

    until ["a", "b", "c", "exit"].include?(agenda)
      print "Please enter either A, B, or C: "
      agenda = gets.chomp
    end

    if agenda == "a"
      library
    elsif agenda == "b"
      create_planet
    else agenda == "exit" || agenda || "c"
      puts "\n🌟 Thanks for exploring Lily Sky's Planetarium! 🌟"
      exit
    end
  end
end

#Declare an array of planet objects and add them to a new solar system object
planet_list = [
  Planet.new("Mercury", "Hermes", 0, 0.4),
  Planet.new("Venus", "Aphrodite", 0, 0.7),
  Planet.new("Earth", "Gaea", 1, 1),
  Planet.new("Mars", "Ares", 2, 1.5),
  Planet.new("Jupiter", "Zeus", 53, 5.2),
  Planet.new("Saturn", "Cronus", 53, 9.5),
  Planet.new("Uranus", "Uranos", 27, 19.2),
  Planet.new("Neptune", "Poseidon", 13, 30.1)
]

our_solar_system = SolarSystem.new(planet_list)


#UI BEGIN
puts  "\n🌟 Welcome to Lily Sky's planetarium! 🌟\n\n"

our_solar_system.playgame
