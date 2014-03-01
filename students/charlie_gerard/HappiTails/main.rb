require 'pry'
require_relative 'Animal'
require_relative 'Client'
require_relative 'Shelter'
require_relative 'relationship'

shelter = Shelter.new
#Animals already in database
shelter.animals["Fred"] = Animal.new("Fred", 2, "male", "Dog", "lol")
shelter.animals["Pat"] = Animal.new("Pat", 2, "male", "Dog", "lol")
shelter.animals["Boog"] = Animal.new("Boog", 2, "male", "Dog", "lol")

#Clients already in database
shelter.clients["Bla"] = Client.new("Bla",2, 35, "Dobby")
shelter.clients["Bla"].num_pets << shelter.animals["Fred"]
binding.pry
shelter.clients["Patrick"] = Client.new("Patrick",2, 46, "Jasper")
shelter.clients["John"] = Client.new("John",2, 52, "Lilly")


#Menu
puts "Would you like to:"
puts "a. Display all animals"
puts "b. Display all clients"
puts "c. Create an animal"
puts "d. Create a client"
puts "e. Adopt an animal"
puts "f. Put an animal for adoption"

response = gets.chomp.downcase

if response == "a"
  puts shelter.animals #Displays all the animals but in a messy way

elsif response == "b"
  puts shelter.clients #Same as above
    
elsif response == 'c'
  print "name: "
  name = gets.chomp
      
  puts "age: "
  age = gets.chomp.to_i
      
  print "gender: "
  gender = gets.chomp
      
  print "species: "
  species = gets.chomp
      
  print "would you like to add a toy?"
  puts "Yes: y // No: n"
  answer = gets.chomp.downcase
    
    while true
      if answer != 'n'
        puts "Please enter the toy: "
        toy = gets.chomp

        puts "Would you like to add another toy?"
        puts "Yes: y // No: n"
        answer = gets.chomp

      elsif answer == 'n'
        break
      end  
    end

 puts "The #{@species} #{@name} has been added to the shelter."
  #Adds the animal in the shelter
  shelter.animals[name] = Animal.new(name, age, gender, species, toy) 

  puts shelter.animals

elsif response == 'd'
  print "name: "
  name = gets.chomp
      
  print "Number of children: "
  num_children = gets.chomp.to_i
      
  print "Age: "
  age = gets.chomp.to_i
      
  print "What are the pets you already own? "
  num_pets = gets.chomp

  #Adds the client to the database  
  shelter.clients[name] = Client.new(name, num_children, age, num_pets)

  shelter.clients[name].num_pets << num_pets

  puts shelter.clients


elsif response == "e"
  puts "Choose a client."
  puts shelter.clients.keys

  adopter = gets.chomp

  puts "Choose an animal."
  puts shelter.animals

  adopted = gets.chomp

  puts "-----------------------------"
  puts "#{adopter} adopted #{adopted}"
  puts '-----------------------------'

#Removes the animal from the database of animals available
    shelter.animals.delete(adopted.to_s)

#Adds the animal to the client
    shelter.clients[adopter].num_pets << adopted

    puts shelter.animals


elsif response == "f"
  puts "What is your name?"

  puts shelter.clients.keys
 
  name = gets.chomp

  binding.pry

  puts "What are the animals you would like to put for adoption?"

  puts shelter.clients[name].num_pets
  
  animals_adoption = gets.chomp.to_s

  adoption = shelter.clients[name].num_pets.delete(animals_adoption.to_s)

  shelter.animals[animals_adoption] << adoption

#Remove the dog from the client's info
# if shelter.clients[name_client].include?animals_adoption
#   shelter.clients[name_client].delete(animals_adoption)
# end

#  relationship.delete(choice_animal.to_s)

end

