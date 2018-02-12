# This program starts its first command on line 370....

#########################################################################################################
# HARD-TYPED DATA:
planets_array =
[{ name: "Mercury",
  year_length: 88, #Earth days
  distance_from_the_sun: 35.98,  #million miles
  planet_type: "Terrestrial",
  number_of_moons: 0,
  interesting_fact1: "Mercury has a solid, cratered surface, much like the Earth's moon.",
  interesting_fact2: "Mercury is only slightly larger than Earth's moon" #
},
{ name: "Venus",
  year_length: 225,
  distance_from_the_sun: 67.24 ,
  planet_type: "Terrestrial",
  number_of_moons: 0,
  interesting_fact1: "hottest planet in our solar system",
  interesting_fact2: "Venus has mountains, valleys, and tens of thousands of volcanoes"
},
{ name: "Earth",
  year_length: 365,
  distance_from_the_sun: 93 ,
  planet_type: "Terrestrial",
  number_of_moons: 1,
  interesting_fact1: "Earth is the biggest of the terrestrial planets",
  interesting_fact2: "The name Earth is at least 1,000 years old"
},
{ name: "Mars",
  year_length: 687,
  distance_from_the_sun: 142 ,
  planet_type: "Terrestrial",
  number_of_moons: 2,
  interesting_fact1: "Mars has two moons named Phobos and Deimos.",
  interesting_fact2: "Mars is a dynamic world that additionally has seasons, polar ice caps, volcanoes, canyons and weather"
},
{ name: "Jupiter",
  year_length: 4333,
  distance_from_the_sun: 484,
  planet_type: "Gas Giant",
  number_of_moons: 53,
  interesting_fact1: "Some of Jupiter's moons have oceans beneath their crusts that might support life",
  interesting_fact2: "Jupiter has 53 known moons, with many additional moons to be confirmed and named"
},
{ name: "Saturn",
  year_length: 10759,
  distance_from_the_sun: 886,
  planet_type: "Gas Giant",
  number_of_moons: 60,
  interesting_fact1: "Like fellow gas giant Jupiter, Saturn is a massive ball made mostly of hydrogen and helium",
  interesting_fact2: "Adorned with thousands of beautiful ringlets, Saturn is unique among the planets"
  }]

  #########################################################################################################
  # CLASS FOR SOLAR SYSTEM

  class SolarSystem

    attr_accessor  :solar_system

    def initialize(planets_array)
      @solar_system = planets_array
      @names = []
      create_names
    end

    # Grab only th names of planets from the planets_array and push it to the new array @names:
    def create_names
      @solar_system.each do |planets_data|
        new_names = planets_data[:name]
        @names << new_names
      end
    end

    def return_planets_name_variable #how to make this betteR?
      return @names
    end

    # Display current Solar system (the list of planets names inside the solar system):
    def list_planets
      puts "\n"
      puts "This is our current Solar System's planets: "
      puts "\n"
      @names.count.times do |i|
        puts "🌕 #{@names[i]}"
      end
      puts "\n"
    end

    # Display planet info based on user choice:
    def display_planet_info(user_input)
      puts "\n"
      the_planet = nil
      @solar_system.each do |planet|
        if planet[:name] == user_input

          # Create new object from class Planet:
          the_planet = Planet.new(planet[:name], planet[:year_length], planet[:distance_from_the_sun], planet[:planet_type], planet[:interesting_fact1], planet[:number_of_moons], planet[:interesting_fact2])
          puts the_planet.return_planet_data

        end
      end
      puts "\n"
    end


    # Method to calculate the distance between two planets:
    def calculate_distance
      puts "\n"
      puts "Please select the two planets you'd like to compare the distance:\n\n"

      print "Planet #1 "
      planet1 = gets.chomp.split.map(&:capitalize).join(' ')
      planet1 = validate_existing_name(planet1, "Planet #1", @names)
      position1 = 0
      @solar_system.each do |planet|
        if planet[:name] == planet1
          position1 = planet[:distance_from_the_sun]
        end
      end

      print "Planet #2: "
      planet2 = gets.chomp.split.map(&:capitalize).join(' ')
      planet2 = validate_existing_name(planet2, "Planet #2", @names)
      position2 = 0
      @solar_system.each do |planet|
        if planet[:name] == planet2
          position2 = planet[:distance_from_the_sun]
        end
      end

      distance = position2 - position1
      return "\n\nThe distance between the plantes #{planet1} and #{planet2} is: #{distance} million miles.\n\n"

    end

    # Method for adding new planet to the system
    def add_new
      puts "Please give me the new planet data:"
      puts "\n"

      print "Planet name: "
      new_planet_name = gets.chomp.split.map(&:capitalize).join(' ') # Capitalize both initials if more than 1 name
      new_planet_name  = validate_new_name(new_planet_name, @names)

      print "Planet's year length (in Earth days): "
      new_planet_lenght = gets.chomp
      new_planet_lenght = validate_numbers(new_planet_lenght)

      print "Planet's distance from the sun(in million miles): "
      new_planet_distance = gets.chomp
      new_planet_distance = validate_numbers(new_planet_distance)

      print "Planet's planet_type: "
      new_planet_type = gets.chomp
      new_planet_type = validate_strings(new_planet_type)

      print "Planet's number of moons: "
      new_planet_moons = gets.chomp
      new_planet_moons = validate_numbers(new_planet_moons)

      print "Planet interesting fact #1: "
      new_planet_interesting_fact1 = gets.chomp
      new_planet_interesting_fact1 = validate_strings(new_planet_interesting_fact1)

      print "Planet interesting fact #2: "
      new_planet_interesting_fact2 = gets.chomp
      new_planet_interesting_fact2 = validate_strings(new_planet_interesting_fact2)
      puts "\n"
      puts "Ok!"

      # Add new_planet info to the variable @solar_system thata holds all the planets' data :
      @solar_system << {:name => new_planet_name, :year_length  => new_planet_lenght,
        :distance_from_the_sun  => new_planet_distance, :planet_type =>  new_planet_type,
        :interesting_fact1  => new_planet_interesting_fact1, :number_of_moons  => new_planet_moons ,
        :interesting_fact2  => new_planet_interesting_fact2}

        # Add new name to the variables @names:
        @names << new_planet_name

        # Display the new planets list:
      end
    end


#########################################################################################################
# CLASS FOR A ESPECIFIC PLANET

class Planet

  attr_reader  :name, :year_length, :distance_from_the_sun, :planet_type, :interesting_fact1, :number_of_moons, :interesting_fact2

  def initialize (name, year_length, distance_from_the_sun, planet_type, interesting_fact1, number_of_moons, interesting_fact2)
    @name = name
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @planet_type = planet_type
    @interesting_fact1 = interesting_fact1
    @number_of_moons = number_of_moons
    @interesting_fact2 = interesting_fact2
  end


  # return the choosen planet's data:
  def return_planet_data
    puts "\n"
    return "\t\t🌜 #{@name} 🌛
✨ The planet #{@name} has a lenght of #{@year_length} Earth days.
✨ The planet #{@name} is #{@distance_from_the_sun} million miles away from the sun.
✨ The planet #{@name} is a #{@planet_type} type.
✨ The planet #{@name} has #{@number_of_moons} moons.
✨ Interesting fact #1: #{@interesting_fact1}.
✨ Interesting fact #2: #{@interesting_fact2}."
  end
end

#########################################################################################################
# CLASS FOR USER ACTIONS

class Actions

  attr_accessor :my_solar_system

  def initialize (my_solar_system)
    @names = my_solar_system.return_planets_name_variable
    @my_solar_system = my_solar_system
  end

  # Method to display options and take user input and turn into an action within the program:
  def take_user_action

    puts " 👉 YOU CAN... "
    puts " ⭐️ SELECT THE PLANET you would like to learn about "
    # puts "\t\tor"
    puts " ⭐️ Type NEW to save a new planet"
    # puts "\t\tor"
    puts " ⭐️ Type DISTANCE to calculate the distance between two planets!" #or DELETE to delete one of the planets?
    puts "\n"

    user_input = gets.split.map(&:capitalize).join(' ')

    if user_input == "New"
      @my_solar_system.add_new
      @my_solar_system.list_planets
      take_user_action

    elsif @names.include?(user_input)
      @my_solar_system.display_planet_info(user_input)
      take_user_action

    elsif user_input == "Distance"
      puts @my_solar_system.calculate_distance
      take_user_action
    else
      invalid_choice(user_input)
      take_user_action
    end

  end
end


#########################################################################################################
# METHODS FOR USER INPUT VERIFICATION

# -------------
# Validation Method for planet choices:
def invalid_choice(user_input)

  if user_input == "Exit"
    exit_with_message
  else
    puts "\n"
    puts "#{user_input} is not a choice!"
    puts "Please enter a valid choice.  "
    puts "\n"
  end
end


# -------------
# Validation method for new planet's name:
def validate_new_name(new_planet_name, names_list)
  if new_planet_name == "Exit"
    exit_with_message
  end

  while new_planet_name == ""
    puts "Your new planet needs a name...."
    print "Please enter a valid name for your new planet.  "
    new_planet_name = gets.chomp.split.map(&:capitalize).join(' ')
  end

  while names_list.include?(new_planet_name)
    puts "There is already a planet with that name."
    print "Please enter a valid name for your new planet.  "
    new_planet_name = gets.chomp.split.map(&:capitalize).join(' ') # Capitalize both initials if more than 1 name
  end

  puts "\n"
  return new_planet_name
end

# -------------
# Validation method for a existing planet's name:
def validate_existing_name(planet, message, names_list)
  while !(names_list.include?(planet))

    if planet == "Exit"
      exit_with_message
    end

    puts "Please select an existing plantet to calculate the distance!"
    print "#{message}: "
    planet = gets.chomp.split.map(&:capitalize).join(' ')

  end
  return planet
end


# -------------
# Validation method for strings inputs from users:
def validate_strings(string_input)
  while string_input == ""
    puts "Your new planet needs a name...."
    print "Please enter a valid information.  "
    string_input = gets.chomp
  end

  puts "\n"
  return string_input
end


# -------------
# Validation Method for numbers:
def validate_numbers (user_number_input)
  while user_number_input.match?(/\D/) && !(user_number_input.match?(/\d\.\d/)) || user_number_input == ""

    if user_number_input == "exit"
      exit_with_message
    else
      print "Input invalid. Please enter a number!  "
      user_number_input = gets.chomp
    end
  end

  puts "\n"
  return user_number_input.to_f
end


# -------------
# Method to display an exit message and terminate program:
def exit_with_message
  puts "\n"
  puts "🌚 This program is exiting.... 🌚"
  puts "\n"
  exit
end


#########################################################################################################
# START TO RUN THE PROGRAM:

# Welcome message and exit instructions:
puts "\n"
puts "✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨"
puts "🌜✨✨✨✨ Welcome to this Solar System data base! ✨✨✨✨🌛
          Type EXIT to quit the program at any time"
puts "\n"

# Create new object for class SolarSystem:
my_solar_system = SolarSystem.new(planets_array)
  # Display a list of existing planets:
my_solar_system.list_planets


# Create new object for class Actions:
actions = Actions.new(my_solar_system)
  # Prompt user for an action and continue running program from there:
  # (Everytime an action is executed, it asks user for a new action)
actions.take_user_action
