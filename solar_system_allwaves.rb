
=begin
                                                SOLAR SYSTEM

This is assignment 4 for Ada cohort 9
Assigned:   18-2-08 pm
Due:        18-2-12 am (before class)

                                                    SPECS:

PROJECT STATEMENT:  A model of the solar system created using classes
                    Three phases:
                        Wave 1:     Planet information is largely hard-coded
                                        * Focus on building a single class
                        Wave 2:     Uses multiple classes that are composed together
                        Wave 3:     A UI is built that allows the user to add own planets

REQUIREMENTS: Wave 1:      1.  Build a single class, SolarSystem:
                              * SolarSystem must have the instance variable, @planets
                                      YUP
                              * An initialize method should be created such that:
                                 -- An array of planet names are stored in @planets
                                       YUP
                          2.  Two additional methods:
                                 * One that contributes additional planets to the list
                                    (via a **parameter**, not user input)
                                        YUP
                                * A second that will RETURN (not print) the ontents of @planets
                                   in an ordered list.
                                        YUP
                          3.  Create code for testing
                                SORT OF
                          4.  "Instead of Strings for planets, modify SolarSystem's initialize
                                method to take a list of hashes where each planet is sent as a hash with
                                at least 5 attributes."
                                    YES

                Wave 2:
                         1. Create a Planet class that will represent a planet.
                            A.  Give Planet an initialize method that will take several arguments and use them
                                to set the class's instance variables

                                YUP
                            B.  Create a method that returns the Planets attributes in an easy-to-read fashion

                                YUP

                            C.  Create reader methods that give the user access to read the instance variables

                                YUP

                         2. Make SolarSystem take an array of Planets instead of hashes

                                YUP

                         3. When printing the planet list or planet details, it should call the corresponding method in Planet.

                                YUP

                Wave 3:
                        1. Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.

                                YUP

                        2. Allow your user to add their own planet.

                                YUP
=end

class SfWorld
  attr_accessor :name, :author, :first_book, :year, :lifeforms
  def initialize (name, author, first_book, year, lifeforms)
    @name = name
    @author = author
    @first_book = first_book
    @year = year
    @lifeforms = lifeforms
  end
  def report_planet_info
    return  "\n\n\tYour planet is called #{@name}.\n
            \tYour planet was created by #{@author}.\n
            \tYour planet appeared in #{@first_book}, \n\t\twhich was first published in #{@year}.\n
            \tAnd your planet is home to life forms such as: \n\t\t#{@lifeforms}.\n\n"
  end
  def describe_new_planet
    puts "\n\nPlease enter the new planet's name:\n"
    @name = gets.chomp.capitalize
    puts "Please enter the name of the author who first wrote about your planet.\n"
    @author = gets.chomp.capitalize
    puts "Please enter the name of a book this planet appeared in.\n"
    @first_book = gets.chomp
    puts "Please enter the year that book was published.\n"
    @year = gets.chomp
    puts "Please name or describe a life form found on your planet.\n"
    @lifeforms = gets.chomp
  end
end

arrakis = SfWorld.new("Arrakis", "Frank Herbert", "Dune", 1965, "sandworms")
solaris = SfWorld.new("Solaris", "Stanislaw Lem", "Solaris", 1961, "a hyperintelligent ocean")
rysemus = SfWorld.new("Rysemus", "Jody Scott", "Passing for Human", 1977, "a 36-foot dolphin/anthropologist named Benaroya")
velm = SfWorld.new("Velm", "Samuel R. Delany", "Stars in My Pocket Like Grains of Sand", 1984, "the evelm")
faraday = SfWorld.new("Faraday", "Ursula K. Le Guin", "Rocannon's World", 1966, "windsteeds")



#For Testing:
#puts arrakis.inspect
#puts arrakis.report_planet_info
#puts solaris.report_planet_info
#puts rysemus.report_planet_info
#puts velm.report_planet_info
#puts faraday.report_planet_info

class SolarSystem
  def initialize (planets)
    @planets = planets
  end
  def add_planets (new_planets)
    @planets << new_planets
  end
  def make_indexed_name_entries
    indexed_entry_array = []
    @planets.each_with_index do |world, counter|
#      puts world.inspect # (FOR TESTING)
      world_entry = "#{counter + 1}.  #{world.name}\n"
      indexed_entry_array << world_entry
    end
    return indexed_entry_array
  end
  def lookup_planet (user_input)
    found_planet = @planets.find {|planet| planet.name == user_input}
    return found_planet
  end
end


sfnal_worlds = SolarSystem.new [arrakis, solaris, rysemus, velm, faraday]
#WAVE 2 TESTING CODE:
#puts sfnal_worlds.inspect
#puts sfnal_worlds.make_indexed_name_entries


#USER INTERFACE

puts "\n\n\t\tWelcome to SCIENCE FICTIONAL PLANET FACTS!\n\n"
puts "Here, you will be offered a list of science fictional planets to learn about.\n\nOr, if you'd rather, you can add your own planet to our repository.\n\n
Ready? Great! Let's go!\n\n"

puts "Here is a list of planets we have on file.\n\n"
puts sfnal_worlds.make_indexed_name_entries
puts "\n\nWould you like to add a planet to the list, or would you like to learn about an existing planet? \n\nTo add a planet, type 'add'. Otherwise, type a listed planet's name.\n\n"
planet_choice = gets.chomp.capitalize
#sfnal_worlds.create_planet_name_array.inspect
if planet_choice == "Add"
  user_world = SfWorld.new("blank", "blank", "blank", "blank", "blank")
  user_world.describe_new_planet
  sfnal_worlds.add_planets (user_world)
  puts "Thanks for the info!  Here's an updated list of planets we know about:\n\n"
  puts sfnal_worlds.make_indexed_name_entries
  puts "\n\n And here's what you told us about your planet:\n\n"
  puts user_world.report_planet_info
#elsif # LOOKUP PROCEDURE
else
  user_planet_pick = sfnal_worlds.lookup_planet(planet_choice)
  if user_planet_pick.nil?
    puts "Wow, I've never heard of that.\n\n Maybe it's time for you to write your own science fiction novel!"
  else
    puts user_planet_pick.report_planet_info
  end
end


#DEPRECATED CODE FROM WAVE 1
#planet_a = { name: "Claire", air_quality: "clean", trees: "red", author: "Fred Schneider", year: 1965}
#planet_b = { name: "Arrakis", air_quality: "dry", trees: "none", author: "Frank Herbert", year: 1979}
#b52s = SolarSystem.new ([planet_a, planet_b)

#MISC DEPRECATED TESTING CODE FROM WAVE 1:
#puts b52s.inspect
#b52s = SolarSystem.new(["Claire"])
#b52s.add_planets("Arrakis")
#puts b52s.inspect
#puts b52s.make_indexed_entries
