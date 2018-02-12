class Planet
  attr_reader :name
  attr_accessor :year_length, :distance_from_sun, :diameter

  def initialize(planet_name)
    @name = planet_name
  end

  def planet_summary
    return "#{name}: \n Takes #{year_length} Earth years to orbit the sun. \n It's distance from the sun is #{distance_from_sun} km. \n #{name}\'s diameter is #{diameter} km."
  end
end

class SolarSystem
  attr_reader :planets, :sys_name # evaluate if this was a good choice for planets
  # attr_accessor :planets

  def initialize(planets, sys_name)
    @planets = planets
    @sys_name = sys_name
    @all_summary = Array.new
    @planet_names = Array.new
    @planet_hash = Hash.new
    create_all_summary
    create_planet_hash
    planet_names

  end

  def add_new_planet(new_planet)
    @planets << new_planet
    create_planet_hash
    create_all_summary
  end

  def create_planet_hash # this method ties the index +1 of the planet to the instance of the planet, for selection in the menu
    # @planet_hash = Hash[@planet_names.zip(@planets)]
    @planets.each.with_index(1) do |planet, index|
      @planet_hash[index] = planet
    end
  end

  def planet_hash
    @planet_hash
  end

  def planet_names # creates an array of planet_names maybe this should just be built in to create_planet_hash - same info can be accessed from there.
    @planets.each do |planet|
      @planet_names << planet.name
    end
  end

  def listplanets
    numbered_planets = ["0: List all summaries"]
    @planets.each.with_index(1) do |planet, index|
      numbered_planet = "#{index}: #{planet.name}"
      numbered_planets << numbered_planet
    end
    numbered_planets = numbered_planets.join("\n")
    return numbered_planets
  end

# ________ the following methods can be produced by looping over @planets and printing each planet's summary
  def create_all_summary
    @planets.each { |planet| @all_summary << planet.planet_summary }
  end

  def print_all_summary
    @all_summary
  end

end


# ________ methods for other options _________


def get_planet_name
  print "What is the name your new planet? > "
  new_planet_name = gets.chomp.capitalize
  return new_planet_name
end

def get_distance # might need to convert ',' to '_' for bignums
  print "How far is this planet from the Sun in miles? > "
  miles_from_sun = gets.chomp
  miles_from_sun = match_number(miles_from_sun)
end

def get_year
  print "How many Earth years does it take to orbit the Sun? > "
  planet_year = gets.chomp
  miles_from_sun = match_number(planet_year)
end

def match_number(num)
  until num.match(/^\-?\d*\.?\d*$/) && !num.empty?
    if !num.match(/^\-?\d*\.?\d*$/)
      print "Invalid input. Please enter a number without commas: "
      num = gets.chomp
    end
    if num.empty?
      print "No number inputted. Please enter a number: "
      num = gets.chomp
    end
  end
  return num
end

# _________ methods for user interface _________

def print_menu(menu)
  menu.each.with_index(1) do |sol_sys, listno|
    puts "#{listno}: #{sol_sys.sys_name}"
  end
  puts
end

def get_solar_system(menu) # not sure why I have both this method and choose_system
  print_menu(menu)
  print "> "
  users_system = gets.chomp.to_i
  if users_system == 1
    users_system = menu[0]
  elsif users_system == 2
    users_system = menu[1]
  else
    puts "WARNING: I don't know that system."
  end
  return users_system
end

def choose_system(menu, chosen_system) # I'm not sure why I made this a method
  if chosen_system == 1 # this works for now, but is not futureproof (a system cannot be added)
    working_system = menu[0]
    return working_system
  elsif chosen_system == 2
    working_system = menu[1]
    return working_system
  else
    puts "I don't know that system!"
  end
  loop_menu = true
  unless loop_menu == false
    print "Would you like to see a different system? (yes/no) > "
    loop_menu = gets.chomp.downcase
    case loop_menu
    when "yes", "y"
      print_menu(menu)
      working_system = choose_system(menu, chosen_system) # this is called recursion(?)
    when "no", "n"
      loop_menu = false
      puts
      puts "Reentering atmosphere. See ya, Earthling~"
      exit
    end
  end
end

def choose_planet(working_system)
  puts working_system.listplanets
  puts
  print "Please select the number of the item you would like to see: "
end

def print_other_options(other_options)
  other_options.each { |num, option| puts "#{num}: #{option}" }
end

def keep_looping(input_variable)
  case input_variable
  when "yes", "y"
    return true
  when "no", "n"
    return false
  else
    puts "I'm not sure what you want"
  end
end
