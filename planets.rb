
class SolarSystem
  attr_accessor :planets, :ranked_planets

  # Stores an array of hashes of info on planets
  def initialize (planets)
    @planets = planets
    @ranked_planets = []
  end

  # Cycles through list of planets
  # Returns numbered list of planets, w/ respect to sun proximity
  def cycle_through_system
    @planets.each do|planet|
      @ranked_planets.push(planet[:name])
    end
    # Ranked numbered list of planets
    return @ranked_planets
  end

  # Returns the planet info based on the name user enters
  def look_up_planet (choice)
    @planets.each do |planet|
      if planet[:name] == choice
        return planet
      end
    end
  end
end

class Planet
  attr_accessor :planet_info, :name, :year_length, :sun_distance, :color, :planet_names
  def initialize (planet_info)
    @planet_info = planet_info
    @name = planet_info[:name].upcase
    @year_length = planet_info[:orbit]
    @sun_distance = planet_info[:sun_distance]
    @color = planet_info[:color]
  end
  def user_friendly_display
    return "\nAt #@sun_distance million miles from the sun,\nA year on the #@color planet #@name passes in #@year_length days.\n"
  end
end

# Hash storing info about each planet
planets = [
  {
    :name => "mercury",
    :orbit => 88,
    :sun_distance => 36,
    :color => "gray"
  },
  {
    :name => "venus",
    :orbit => 225,
    :sun_distance => 67.2,
    :color => "yellow"
  },
  {
    :name => "earth",
    :orbit => 365,
    :sun_distance => 93,
    :color => "blue"
  },
  {
    :name => "mars",
    :orbit => 687,
    :sun_distance => 141.6,
    :color => "rust"
  },
  {
    :name => "jupiter",
    :orbit => 4333,
    :sun_distance => 483.6,
    :color => "orange"
  },
  {
    :name => "saturn",
    :orbit => 10756,
    :sun_distance => 886.7,
    :color => "gold"
  },
  {
    :name => "uranus",
    :orbit => 30687,
    :sun_distance => 1784,
    :color => "blue"
  },
  {
    :name => "neptune",
    :orbit => 60190,
    :sun_distance => 2000,
    :color => "blue"
    } ]

    # UI: welcomes and prompts user for input
    puts "Hello and welcome to Planet Gazer"
    puts "You can learn about a planet in The Solar System or create your own."
    puts "Please enter y to begin"
    play = gets.chomp.downcase

    while play == "y"
      # Ask user for planet they want to know about
      puts "\nType the planet name exactly as it appears below to learn more."
      puts "Or, enter NEW to create your own planet\n"

      solar_system = SolarSystem.new(planets)
      current_planets = solar_system.cycle_through_system
      puts "\n"
      current_planets.each {|planet| puts planet.upcase}
      user_planet_choice = gets.chomp.downcase

      if user_planet_choice == "new"
        # have user enter info on their planet
        puts "\nYay! New planet in the Solar System."
        puts "Please enter the planet's name"
        new_planet_name = gets.chomp

        puts "\nPlease enter days it takes #{new_planet_name} takes to orbit the sun. All non-numerical values default to 0 days."
        new_planet_orbit = gets.chomp.to_i

        puts "\nPlease enter #{new_planet_name}'s distance from the sun in million miles. All non-numerical values default to 0 million miles."
        new_planet_sun_distance = gets.chomp.to_i

        puts "\nPlease enter #{new_planet_name}'s color."
        new_planet_color = gets.chomp

        new_planet = {
          :name => new_planet_name,
          :orbit => new_planet_orbit, :sun_distance => new_planet_sun_distance,
          :color => new_planet_color
        }

        planets.push(new_planet)
        chosen_planet = solar_system.look_up_planet(new_planet_name)
        planet_choice = Planet.new(chosen_planet)
        puts planet_choice.user_friendly_display
      elsif current_planets.include?(user_planet_choice)
        # use class planet to collect planet info
        # use class solar system to return planet info to the user
        chosen_planet = solar_system.look_up_planet(user_planet_choice)
        planet_choice = Planet.new(chosen_planet)
        puts planet_choice.user_friendly_display
      else
        puts "\n Uh-oh. You entered an invalid response.\n"
      end
      puts "\n\nTo continue learning, enter y."
      puts "Enter anything else to take a break from learning.\n"
      play = gets.chomp.downcase
    end
    puts "\n Live long and prosper"
    puts "                    Peace and long life\n"
