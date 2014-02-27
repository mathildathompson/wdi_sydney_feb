require 'pry'
require_relative 'Animal'
require_relative 'Client'
require_relative 'Shelter'
require_relative 'relationship'

shelter = Shelter.new

#Clients 
shelter.clients["Frank"] = Client.new("Frank",2, 35, 6)
shelter.clients["Patrick"] = Client.new("Patrick",3, 33, 1)
shelter.clients["John"] = Client.new("John",2, 45, 3)

#Animals 
shelter.animals["Fido"] = Animal.new("Fred", 2, "male", "Dog", "Ball")
shelter.animals["Mickey"] = Animal.new("Mickey", 5, "male", "Mouse", "Spinning Wheel")
shelter.animals["Garfield"] = Animal.new("Garfield", 2, "male", "Dog", "Catnip")

#relationship = Relationship.new

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
    shelter.animals.each do |x|
    puts x
  end

elsif response == "b"
  puts shelter.clients #Same as above
    
elsif response == 'c'
  print "name: "
  name = gets.chomp
      
  print "age: "
  age = gets.chomp.to_i
      
  print "gender: "
  gender = gets.chomp
      
  print "species: "
  species = gets.chomp
      
  puts "would you like to add a toy?"
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

  #Adds the animal in the shelter
  shelter.animals[@pets] = Animal.new(name, age, gender, species, toy) 

  puts shelter.animals

elsif response == 'd'
  print "name: "
  name = gets.chomp
      
  print "Number of children: "
  num_children = gets.chomp.to_i
      
  print "Age: "
  age = gets.chomp.to_i
      
  print "How many pets do you already own: "
  num_pets = gets.chomp
      
  #Adds the client to the database  
  shelter.clients[@user] = Client.new(name, num_children, age, num_pets)

  puts shelter.clients


elsif response == "e"
  puts "Choose a client."
  puts shelter.clients.keys

  choice_client = gets.chomp

  puts "Choose an animal."
  puts shelter.animals

  choice_animal = gets.chomp

 #Come back to this one. Charlie was trying to associate the client with the dog adopted

#Removes the animal from the database
    shelter.animals.delete(choice_animal.to_s)

    puts shelter.animals

    puts "#{choice_client} adopted #{choice_animal}. #{choice_animal} has now left the shelter."


elsif response == "f"
  puts "What is your name?"
  shelter.clients.each do |x|
    puts x
  end
    choice_client = gets.chomp

  puts "What animal do you want to put up for adoption?"
    shelter.animals.each do |y|
    puts y
  end
    choice_animal = gets.chomp


##Come back to this. Not working. this pushes these variables into shelter
    shelter.throwaway( choice_client, choice_animal )

    #This should remove the client and animal from the relationship
    relationship.delete(choice_animal.to_s)
 # binding.pry
end





