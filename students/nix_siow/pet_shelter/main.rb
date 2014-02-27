require 'pry'

require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

#create an empty shelter
shelter = Shelter.new

##TEST DATA ONLY
a1 = Animal.new("Mittens",2,"Female","Cat")
a2 = Animal.new("Rover",7,"Male","Dog")
a3 = Animal.new("Guppy",1,"Female","Fish")

shelter.animals[a1.name] = a1
shelter.animals[a2.name] = a2
shelter.animals[a3.name] = a3

c1 = Client.new("Simon",0,29)
c2 = Client.new("Nix",0,24)

shelter.clients[c1.name] = c1
shelter.clients[c2.name] = c2

shelter.adopt("Nix","Rover")

#---------------------------

loop do

#prompt the user for input
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Print animals"
  puts "4. Print clients"
  puts "5. Adopt animal"
  puts "6. Give up animal"
  puts "7. Quit"
  puts "Please input a number corresponding to the option you desire."

  input = gets.chomp.to_i

  puts "---------------------------------"

  case input
  when 1
    puts "Please input the animal's name"
    name = gets.chomp
    puts "Please input the animal's age"
    age = gets.to_i
    puts "Please input the animal's gender (male/female)"
    gender = gets.chomp
    puts "Please input the animal's species"
    species = gets.chomp

    puts "Does this animal have any toys (y/n?)"
    toys_yn = gets.chomp.downcase

    animal = Animal.new(name, age, gender, species)

    if toys_yn == 'y'
      loop do
        puts "Please enter the name of the toy (leave blank and enter to exit)"
        toy = gets.chomp
        
        if toy == ""
          break
        else
          animal.toys.push toy
        end
      end
    end

    shelter.animals[name] = animal

  when 2
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the number of children you have"
    children = gets.chomp
    puts "Please input your age"
    age = gets.to_i

    client = Client.new(name, children, age)

    shelter.clients[name] = client

  when 3
      shelter.print_animals
  when 4
      shelter.print_clients

  when 5
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the animal's name"
    animal = gets.chomp

    shelter.adopt(name, animal)

  when 6
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the animal's name"
    animal = gets.chomp

    shelter.give_up(name, animal)

  when 7
    puts "Exiting program..."
    break

  else
    puts "Please input a valid option!?"
  end

  puts "---------------------------------"

end


binding.pry