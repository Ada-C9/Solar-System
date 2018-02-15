
class SolarSystem
  attr_accessor :ss

  def initialize(planet_1, planet_2 )
    @ss = [planet_1, planet_2]

  end

  # adds another planet
  def add_planet(new_planet)
    @ss << new_planet

  end
  # prints the planets out in a list
  def planet_list
    list = []
    count = 0
    @ss.each do |planets|
      count += 1
      list << "#{count}.#{planets.planet_name}\n"

    end
    return list
  end

  def pick_planet(user_pick)
    @ss.each do |planets|
      if planets.planet_name == user_pick
        puts "#{planets.details}\n\n\n#{planets.planet_attributes}"

      end
    end
  end
end

class Planet
  attr_accessor :planet_name, :discovery, :attributes


  def initialize(planet_name, discovery, attributes)
    @planet_name = planet_name
    @discovery = "#{planet_name} was discovered in the year #{discovery}."
    # to define the values of the attributes maybe create a method that sets
    # sets user input to a variable and iterates through the the keys reassining their
    # values based on user response to prompts
    @attributes = {mass: "", gravity: "", orbit: "", day_length: "", yr_length: ""}

  end

  def planet_name
    return @planet_name

  end

  def details
    return @discovery

  end

  def change_value(user_key, user_value)
    @attributes = {}
    count = 0
    @attributes[:user_key] = user_value
    while count < 3
      puts "what attribute would you like to add?(i.e. gravity, mass, length of a day.)"
      user_key = gets.chomp
      puts "what is the value of #{user_key}? (i.e. mass is 317.8)"
      user_value = gets.chomp
      @attributes[:user_key] = user_value
    end

    return @attributes

  end

  def planet_attributes
    about_planet = []
    @attributes.each do |key, value|
      about_planet << "#{@planet_name}'s #{key} is #{value}.\n"

    end
    puts about_planet
  end
end


# Create a method that pre-populates the solar system with 8 planets
planet_a = Planet.new("Jupiter","1882","details")
planet_b = Planet.new("Uranus", "1932","about")


# Prints out current planets in the solar system
my_ss = SolarSystem.new(planet_a, planet_b)

def user_choice(solar_system,planet_choice)

  if solar_system.planet_list.include?(planet_choice)
    return solar_system.pick_planet(planet_choice)
  else
    while solar_system.planet_list.include?(planet_choice) == false
      print "Please enter a planet on the list.\s"
      planet_choice = gets.chomp.downcase.capitalize
      return solar_system.pick_planet(planet_choice)

    end

  end
end


def know_another_question
  puts "Would you like to know more about another planet? Enter (Y/N)\s"

end

def which_planet_question
  puts "which planet would you like to know more about?"

end

def create_planet_question
  puts "Would you like to add a planet?"

end
def user_planet_name
  puts "what would you like to name your planet?"

end


# defines and adds a new planet to the SolarSystem
def add_planet(name, date_discovered,input)
  planet = Planet.new(name, date_discovered, input)
  return planet

end

# User interface
puts "Welcome to the Solar System App!"
puts "Click around and see what you can find!"

puts my_ss.planet_list

# Checks to see if user wants to know more about the planets in the solar system
print "Would you like to know more about a particular planet? Enter (Y/N)\s"
know_more = gets.chomp.downcase
# If the user wants to see more about the solar system check to see which planet
if know_more == "y" || know_more == "yes"
  which_planet_question()
  which_planet = gets.chomp
  user_choice(my_ss,which_planet)
  know_another_question()
  know_another = gets.chomp.downcase
  while know_another == "y" || know_another == "yes"
    which_planet_question()
    which_planet = gets.chomp
    user_choice(my_ss, know_another)
    know_another_question
    know_another = gets.chomp.downcase
  end
  case know_another
  when "n","no"
    create_planet_question
    user_create = gets.chomp.downcase
    if user_create == "y" || user_create == "yes"
      user_planet_name
      user_planet = gets.chomp
      puts "when was your planet discovered?"
      user_planet_details = gets.chomp
      puts "how many attributes does your planet have?"
      attributes = gets.chomp
      add_planet(user_planet, user_planet_details, attributes)
      # puts here to test
      puts "what attribute would you like to add?(i.e. gravity, mass, length of a day.)"
      user_key = gets.chomp
      puts "what is the value of #{user_key}? (i.e. mass is 317.8)"
      user_value = gets.chomp
      change_value(user_key, user_value)

      planet.planet_attributes

      my_ss.add_planet(planet)


      puts "You have added a new planet to the solar system!"
    else
      puts "Thank you for using the Solar System App!"
    end

  end
elsif know_more == "n" || know_more == "no"
  create_planet_question
  user_create = gets.chomp.downcase
  if user_create == "y" || user_create == "yes"
    user_planet_name
    user_planet = gets.chomp
    puts "when was your planet discovered?"
    user_planet_details = gets.chomp
    puts "how many attributes does your planet have?"
    attributes = gets.chomp
    add_planet(user_planet, user_planet_details, attributes)
    # puts here to test
    puts "what attribute would you like to add?(i.e. gravity, mass, length of a day.)"
    user_key = gets.chomp
    puts "what is the value of #{user_key}? (i.e. mass is 317.8)"
    user_value = gets.chomp
    change_value(user_key, user_value)

    planet.planet_attributes

    my_ss.add_planet(planet)


    puts "You have added a new planet to the solar system!"
  else
    puts "Thank you for using the Solar System App!"
  end
end
