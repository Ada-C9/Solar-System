require_relative 'classes_methods.rb'

# ______ milky_system ______
planetA = Planet.new("Mercury")
planetA.distance_from_sun = 36_000_000
planetA.year_length = "0.2 Earth years"

planetB = Planet.new("Venus")
planetB.distance_from_sun = 67_000_000
planetB.year_length = "0.6 Earth years"

planetC = Planet.new("Earth")
planetC.distance_from_sun = 93_000_000
planetC.year_length = "365.26 Earth days"

planetD = Planet.new("Mars")
planetD.distance_from_sun = 142_000_000
planetD.year_length = "1.9 Earth years"

planetE = Planet.new("Jupiter")
planetE.distance_from_sun = 484_000_000
planetE.year_length = "11.9 Earth years"

planetF = Planet.new("Saturn")
planetF.distance_from_sun = 887_000_000
planetF.year_length = "29.5 Earth years"

planetG = Planet.new("Uranus")
planetG.distance_from_sun = 1_784_000_000
planetG.year_length = "84 Earth years"

planetH = Planet.new("Neptune")
planetH.distance_from_sun = 2_794_000_000
planetH.year_length = "164.8 Earth years"

#____alpha_centauri_____
planet1 = Planet.new("Alpha Centauri Bb")
planet1.distance_from_sun = 111_111_111
planet1.year_length = "123 Earth years"

#____instantiate Solar Systems
human_system = [planetA, planetB, planetC, planetD, planetE, planetF, planetG, planetH]
milky_system = SolarSystem.new(human_system, "Milky Way") # making a new human_system
alpha_planets= [planet1]
alpha_centauri = SolarSystem.new(alpha_planets, "Alpha Centauri")

menu = [milky_system, alpha_centauri]

#_____for the user interface_____
puts "Welcome to our Solar System viewer. Let's takeoff . . ."
puts
puts "        /\\"
puts "       |  |"
puts "       |  |"
puts "      /|/\\|\\"
puts "     /_||||_\\"
puts "      T    T"
puts "\n"

puts "MENU:"
puts "0: Add a planet"
print_menu(menu)
print "Please select the number of the menu item to access: "
menu_selection = gets.chomp.to_i
puts

case menu_selection
when 0
  print "Would you like to create a new planet? > "
  create_new = gets.chomp.downcase
  puts
  case create_new
  when "yes", "y"
    users_solar_system = get_solar_system(menu) # getting solar system to add to
    puts

    new_planet_name = get_planet_name # getting users planet name
    user_planet = Planet.new(new_planet_name) # instantiating a new planet
    users_solar_system.add_new_planet(user_planet) # adding the new planet to the human_system hash
    puts

    new_planet_dist = get_distance # getting the distance of the newly created planet
    user_planet.distance_from_sun = new_planet_dist # adding this new distance to the planet's instance
    puts

    new_planet_year = get_year
    user_planet.year_length = new_planet_year
    puts
  else # THIS CURRENTLY DOES NOT LOOP BACK INTO A MENU THAT CAN BE INTERACTED WITH
    puts "I wouldn't want to play god either! \n \n"
    puts "MENU:"
    puts "0: Add a planet"
    print_menu(menu)
    print "Please select the number of the system you would like to browse: "
    menu_selection = gets.chomp.to_i
  end
when 1, 2
  working_system = choose_system(menu, menu_selection)

  puts "\n"

  view_systems = true
  until view_systems == false


    print_planet_menu = true
    until print_planet_menu == false
      puts "Here is the list of planets in the #{working_system.sys_name}:"
      puts
      choose_planet(working_system)
      planet_choice = gets.chomp.to_i
      puts

      until working_system.planet_hash.keys.include?(planet_choice)
        puts "Invalid selection. Please choose a planet from the following list: "
        choose_planet(working_system)
        planet_choice = gets.chomp.to_i
      end
      puts working_system.planet_hash[planet_choice].planet_summary
      puts

      print "Would you like to see information on another planet? > "
      loop_again = gets.chomp.downcase
      print_planet_menu = keep_looping(loop_again)
      puts
    end

    print "Would you like to view another system? > "
    loop_all_again = gets.chomp.downcase
    view_systems = keep_looping(loop_all_again)
  end

  puts
  puts "Reentering atmosphere. See ya, Earthling~"
end
