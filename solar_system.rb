require_relative 'classes_methods.rb'

# ______ milky_system ______
planetA = Planet.new("Mercury")
planetA.distance_from_sun = 57_900_000
planetA.year_length = 0.2
planetA.diameter = 4878

planetB = Planet.new("Venus")
planetB.distance_from_sun = 108_160_000
planetB.year_length = 0.6
planetB.diameter = 12_104

planetC = Planet.new("Earth")
planetC.distance_from_sun = 93_000_000
planetC.year_length = 1
planetC.diameter = 12_756

planetD = Planet.new("Mars")
planetD.distance_from_sun = 227_936_640
planetD.year_length = 1.9
planetD.diameter = 6794

planetE = Planet.new("Jupiter")
planetE.distance_from_sun = 778_369_000
planetE.year_length = 11.9
planetE.diameter = 142_984

planetF = Planet.new("Saturn")
planetF.distance_from_sun = 1_427_034_000
planetF.year_length = 29.5
planetF.diameter = 120_536

planetG = Planet.new("Uranus")
planetG.distance_from_sun = 2_870_658_186
planetG.year_length = "84"
planetG.diameter = 51_118

planetH = Planet.new("Neptune")
planetH.distance_from_sun = 4_496_976_000
planetH.year_length = "164.8"
planetH.diameter = 49_532

#____alpha_centauri_____
planet1 = Planet.new("Alpha Centauri Bc")
planet1.distance_from_sun = 21_093_000
planet1.year_length = 12
planet1.diameter = 12_000

planet2 = Planet.new("Proxima Centauri b")
planet2.distance_from_sun = 7_500_000
planet2.year_length = 11.2
planet2.diameter = 14_030

#____instantiate Solar Systems
human_system = [planetA, planetB, planetC, planetD, planetE, planetF, planetG, planetH]
milky_system = SolarSystem.new(human_system, "Milky Way") # making a new human_system
alpha_planets= [planet1, planet2]
alpha_centauri = SolarSystem.new(alpha_planets, "Alpha Centauri")

menu = [milky_system, alpha_centauri] # this has now become a poor variable name

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

menu_viewer = true
until menu_viewer == false


  puts "\nMENU:"
  puts "0: Other options"
  print_menu(menu)
  print "Please select the number of the menu item to access: "
  menu_selection = gets.chomp.to_i
  puts

  #_______ this needs case/when statement for selecting between adding a planet and calculating the distance between two planets in one system

  case menu_selection
  when 0
    other_options = {1 => "Add a planet", 2 => "Calculate distance between two planets"}
    print_other_options(other_options)
    print "\nPlease select the number of the menu item to access: "
    select_other_option = gets.chomp.to_i

    until other_options.keys.include?(select_other_option)
      puts "Invalid selection. Please select a number from the following menu: "
      print_other_options(other_options)
      select_other_option = gets.chomp.to_i
    end

    case select_other_option
    when 1
      print "Would you like to create a new planet? > "
      create_new = gets.chomp.downcase
      puts

      unless create_new == ("no" || "n")
        puts "Which solar system is the planet in? "
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

        puts user_planet.planet_summary
        puts
      else
        puts "I wouldn't want to play god either! \n \n"
      end

    when 2
      print "\nWould you like to calculate the distance between two planets in the same system? > "
      calculate_distance = gets.chomp.downcase


      unless calculate_distance == ("no" || "n")
        puts "\nWhich solar system are the planets in?"
        users_solar_system = get_solar_system(menu)
        puts
        # working_system = choose_system(menu, users_solar_system)

        # print_planet_menu = true
        # until print_planet_menu == false
        puts "Here is the list of planets in the #{users_solar_system.sys_name}:"
        puts
        puts users_solar_system.listplanets
        print "Please select the number of the first planet: "
        planet_choice1 = gets.chomp.to_i
        puts

        until users_solar_system.planet_hash.keys.include?(planet_choice1)
          puts "Invalid selection. Please choose a planet from the following list: "
          puts users_solar_system.listplanets
          puts "> "
          planet_choice1 = gets.chomp.to_i
        end

        print "Please select the number of the second planet: "
        planet_choice2 = gets.chomp.to_i

        until users_solar_system.planet_hash.keys.include?(planet_choice2) # this isn't DRY
          puts "Invalid selection. Please choose a planet from the following list: "
          puts users_solar_system.listplanets
          planet_choice2 = gets.chomp.to_i
          puts "> "
        end
      end

      #____ need to correlate numbered choice to planet
      planet_choice1 = users_solar_system.planet_hash[planet_choice1]
      planet_choice2 = users_solar_system.planet_hash[planet_choice2]
      distance_between_planets = planet_choice1.distance_from_sun - planet_choice2.distance_from_sun
      puts "#{planet_choice1.name} is #{distance_between_planets} km away from #{planet_choice2.name}."
    end

  when 1, 2
    working_system = choose_system(menu, menu_selection)

    puts "\n"

    # view_systems = true
    # until view_systems == false


      print_planet_menu = true
      until print_planet_menu == false
        puts "Here is the list of planets in the #{working_system.sys_name}:"
        puts
        choose_planet(working_system)
        planet_choice = gets.chomp.to_i
        puts

        until working_system.planet_hash.keys.include?(planet_choice) || planet_choice == 0
          puts "Invalid selection. Please choose a planet from the following list: "
          choose_planet(working_system)
          planet_choice = gets.chomp.to_i
        end

        case planet_choice
        when 0
          puts working_system.print_all_summary
        else
          puts working_system.planet_hash[planet_choice].planet_summary
        end
        puts

        print "Would you like to see information on another planet in this system? > "
        loop_again = gets.chomp.downcase
        print_planet_menu = keep_looping(loop_again)
        # puts
      end
      print "\nWould you like to view the menu? > "
      viewing_menu = gets.chomp.downcase
      menu_viewer = keep_looping(viewing_menu)

      # print "Would you like to view another system? > "
      # loop_all_again = gets.chomp.downcase
      # view_systems = keep_looping(loop_all_again)
    # end
  else
    puts "Invalid selection. \n Please select a number from the following menu: "
    next
  end

end
puts
puts "Reentering atmosphere. See ya, Earthling~"
