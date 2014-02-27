require 'pry'
require_relative 'Animal'
require_relative 'Client'
require_relative 'Shelter'
require_relative 'relationship'

shelter = Shelter.new

#Clients already in database
shelter.clients["Bla"] = Client.new("Bla",2, 35, "Dog")
shelter.clients["Patrick"] = Client.new("Patrick",2, 46, "Bird")
shelter.clients["John"] = Client.new("John",2, 52, "Cat")

#Animals already in database
shelter.animals["Fred"] = Animal.new("Fred", 2, "male", "Dog", "lol")
shelter.animals["Pat"] = Animal.new("Pat", 2, "male", "Dog", "lol")
shelter.animals["Boog"] = Animal.new("Boog", 2, "male", "Dog", "lol")


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
  num_pets = gets.chomp.split( )
  
  #Adds the client to the database  
  shelter.clients[name] = Client.new(name, num_children, age, num_pets)

  puts shelter.clients


elsif response == "e"
  puts "Choose a client."
  puts shelter.clients.keys

  adopter = gets.chomp

  puts "Choose an animal."
  puts shelter.animals

  adopted = gets.chomp

#Trying to associate the client with the dog adopted but doesn't seem to work
  @relationship = Relationship.new( adopter, adopted )

  puts "-----------------------------"
  puts "#{adopter} adopted #{adopted}"
  puts '-----------------------------'

  #Tried to add the adopted animal to the values of the client.
  #shelter.clients[adopter].push(adopted)

#Removes the animal from the database
    shelter.animals.delete(adopted.to_s)

    puts shelter.animals


#I am not sure how this part is supposed to work
#Is the client returning the adopted pet?
#Or is a brand new client putting a pet for adoption?
#In that case it would be the same as option 'c': create an animal

elsif response == "f"
  puts "What is your name?"
 
  name_client = gets.chomp

  puts "What are the animals you would like to put for adoption?"
  
  animals_adoption = gets.chomp.to_s

#Remove the dog from the client's info
# if shelter.clients[name_client].include?animals_adoption
#   shelter.clients[name_client].delete(animals_adoption)
# end

#  relationship.delete(choice_animal.to_s)

end

