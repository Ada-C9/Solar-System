class SolarSystem
  # initialized SolarSystem object with an array of Planet objects.
  attr_reader:solar_sys_age
  def initialize(user_planet,solar_sys_age)
    @planets = user_planet
    @solar_sys_age = solar_sys_age
  end
  # adds a Planet object to an array of Planets
  def add_planet(new_planet)
    @planets.push(new_planet)
    return @planets
  end
  # iterates through array of Planet objects and displays a formatted list to user.
  def list_of_planets()
    counter = 0
    planet_names = ""
    @planets.each do |planet|
      planet_names += "\n#{counter+1}. #{planet.planet_details}"
      counter+=1
    end
    return planet_names
  end

end



class Planet
  attr_reader:name, :radius_mi, :distance_frm_sun, :num_moons, :num_suns, :year_in_days

  # initialize Planet object with a mixture of string and integer attributes
  def initialize(name, radius_mi, distance_frm_sun, num_moons, num_suns, year_in_days)
    @name = name
    @radius_mi = radius_mi
    @distance_frm_sun = distance_frm_sun
    @num_moons = num_moons
    @num_suns  = num_suns
    @year_in_days = year_in_days
  end
  # returns formatted list of a planet's detail.
  def planet_details ()
    return planet_detail = "\n#{@name} Planet Information : \nRadius (mi): #{@radius_mi}\nDistance from Sun (mi): #{@distance_frm_sun}\nNumber of moons: #{@num_moons}\nNumber of suns: #{@num_moons}\nNumber of days in year: #{@year_in_days}\n"
  end
end


def menu()
  # Built-in planet list
  earth =  Planet.new("Earth", 3959, 92960000, 1, 1, 365)
  jupiter =  Planet.new("Jupiter", 43441, 483800000, 67, 1, 4300)
  venus =  Planet.new("Venus", 3760 , 67000000, 0, 1, 225)
  planet_of_the_puppies = Planet.new("Planet of the Puppies", 3959, 336000000, 15, 38, 180)

  # Built-in solar-system
  a_solar_system = [earth,jupiter,venus,planet_of_the_puppies]
  new_solar_system = SolarSystem.new(a_solar_system,400000000)

  puts "\nEnter (A) if you'd like to learn information about some planets.\n\n"
  puts "Enter (B) if you'd like to input some new information to help us grow!\n\n"
  puts "Or press any key to exit."
  print "\nMenu choice: "
  menu_choice = gets.chomp.upcase
  # loop to direct and keep user within menu
  while menu_choice == 'A' || menu_choice == 'B'
    if menu_choice == 'A'
      puts "\nHere's a list of the planets you can pick from.\n"
      counter = 1
      # prints a formatted list to the user.
      a_solar_system.each do |planet|
        puts "#{counter}. #{planet.name}"
        counter+=1
      end
      print "Planet choice: "
      user_planet = gets.chomp
      check_in_list_counter = 0

      # compares user input to current planet list.
      a_solar_system.each do |planet|
        if planet.name.upcase == user_planet.upcase
          print planet.planet_details
        else
          check_in_list_counter+=1
        end
      end

      if  check_in_list_counter == a_solar_system.length
        puts "\nSorry not in the list :/ "
      end
    elsif menu_choice == 'B'
      print "\nEnter your planets name:"
      user_planet = gets.chomp
      print "\nEnter your planet's radius: "
      user_radius = gets.chomp
      print "\nEnter your planet's distance from the sun: "
      user_dist_frm_sun = gets.chomp
      print "\nEnter how many moons your planet has: "
      user_num_moons = gets.chomp
      print "\nEnter how many suns your planet has: "
      user_num_suns = gets.chomp
      print "\nEnter how many days make a year: "
      user_day_in_year = gets.chomp

      user_planet = Planet.new(user_planet,user_radius,user_dist_frm_sun,user_num_moons,user_num_suns,user_day_in_year)

      new_solar_system.add_planet(user_planet)
      puts "\nYour planet has been added!"
    end
    puts "\nEnter (A) if you'd like to learn information about some planets.\n\n"
    puts "Enter (B) if you'd like to input some new information to help us grow!\n\n"
    puts "Press any key to exit."
    print "Menu choice:"
    menu_choice = gets.chomp.upcase
  end
  puts "\nThank you, good-bye!"

end

menu()
