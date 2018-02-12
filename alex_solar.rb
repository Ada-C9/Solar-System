################## WAVE 1 ##############
class SolarSystem
  attr_accessor :planets_in_ss

  def initialize(planets_in_ss)
    @planets_in_ss = planets_in_ss
  end

  def add_planet(new_planet)
    @planets_in_ss.push(new_planet)
  end

  def list_planets_in_ss
    @planets_in_ss.each_with_index do |planet, index|
      puts "\t#{index + 1}. #{planet}"
    end
  end

end

# planet_a = {name: "Mars", AttrA: "blah", AttrB: 45}
# planet_a.SolarSystem.new([planet_a])

############### WAVE 2 ################
class Planet
  attr_reader :name, :sun_distance, :orbit_years, :greek_god, :meaning

  def initialize(planet_name, sun_distance, orbit_years, greek_god, meaning)
    @name = planet_name
    @sun_distance = sun_distance
    @orbit_years = orbit_years
    @greek_god = greek_god
    @meaning = meaning
  end

  def to_s
    return @name
  end

  def display_attributes
    puts "\n~ #{@name} Summary ~"
    info = "At #{@sun_distance} million miles from the sun, it takes #{@name} #{@orbit_years} years to complete an orbit. In ancient Greece, it was associated with #{@greek_god}, who is the god/ess of #{@meaning}.\n"
    puts info
  end

end

mercury = Planet.new("Mercury", "35.98", "0.24", "Hermes", "messengers, travel and/or commerce")
venus = Planet.new("Venus", "67.24", "0.61", "Aphrodite", "romance and lust")
mars = Planet.new("Mars", "141.6", "1.88", "Ares", "war")
jupiter = Planet.new("Jupiter", "483.8", "11.86", "Zeus", "sky and thunder")
saturn = Planet.new("Saturn", "888.2", "29.4", "Cronus", "agriculture")


astromythos = SolarSystem.new([mercury, venus, mars, jupiter, saturn])

########### WAVE 3 ##############

# methods
def planet_attributes(user_selection, astromythos)
  while !(user_selection == "Q")
    planet_index = user_selection.to_i - 1
    if planet_index >= 0 && planet_index <= astromythos.planets_in_ss.length - 1
      astromythos.planets_in_ss[planet_index].display_attributes
    elsif user_selection.capitalize == "New"
      user_add_planet(user_selection, astromythos)
    else
      print "That selection is invalid, please try again > "
      user_selection = gets.chomp.capitalize
    end
    return planets_list(user_selection, astromythos)
  end
  exit
end

def planets_list(user_selection, astromythos)
  puts
  astromythos.list_planets_in_ss
  print "\nEnter selection > "
  user_selection = gets.chomp.capitalize
  planet_attributes(user_selection, astromythos)
end

def user_add_planet(user_selection, astromythos)
  puts "\nAwesome! You will now create a new planet. Please enter a few details."
  print "Planet name > "
  name = gets.chomp.capitalize
  print "Distance from sun (million miles) > "
  sun_distance = gets.chomp
  print "Orbital period (years) > "
  orbit_years = gets.chomp
  print "Associated god/ess > "
  greek_god = gets.chomp.capitalize
  print "Associated meaning > "
  meaning = gets.chomp

  name = Planet.new(name, sun_distance, orbit_years, greek_god, meaning)
  astromythos.add_planet(name)

  planets_list(user_selection, astromythos)
end

# prompts
puts "WELCOME TO THE ASTROMYTHOS SOLAR SYSTEM"
puts "~ Type a planet number to learn more."
puts "~ Type 'NEW' to add a new planet."
puts "~ Type 'Q' to quit.\n\n"

astromythos.list_planets_in_ss

print "\nEnter selection > "
user_selection = gets.chomp.capitalize

if user_selection == "New"
  user_add_planet(user_selection, astromythos)
elsif user_selection == "Q"
  exit
end

planet_attributes(user_selection, astromythos)
