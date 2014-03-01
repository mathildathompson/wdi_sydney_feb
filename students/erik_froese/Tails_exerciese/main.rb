require 'pry'
require_relative 'Animal'
require_relative 'Client'
require_relative 'Shelter'
require_relative 'relationship'

shelter = Shelter.new

shelter.clients["Toodles"] = Client.new("Toodles", 7, 88, 9)
shelter.clients["Bla"] = Client.new("Bla", 2, 35, 6)
shelter.animals["Fred"] = Animal.new("Fred", 2, "male", "Dog")
shelter.animals["Erik"] = Animal.new("Erik", 3, "male", "Dinosaur")

relationship = Relationship.new
#binding.pry

puts "Would you like to:"
puts "a. Display all animals"
puts "b. Display all clients"
puts "c. Create an animal"
puts "d. Create a client"
puts "e. Adopt an animal"
puts "f. Put an animal for adoption"

response = gets.chomp.downcase

if response == "a"
	puts shelter.animals.keys
  

elsif response == "b"
    puts shelter.clients.keys
  
    
elsif response == 'c'
  	print "name: "
  	name = gets.chomp
      
  	puts "age: "
  	age = gets.chomp.to_i
      
  	print "gender: "
  	gender = gets.chomp
      
  	print "species: "
  	species = gets.chomp
      
  	shelter.animals.merge!(name => [name, age, gender, species])
    puts "We do not accept toys in this shelter, so do not ask."
  	
    puts shelter

  elsif response == 'd'
    print "name: "
    name = gets.chomp
      
    print "Number of children: "
    num_children = gets.chomp.to_i
      
    print "Age: "
    age = gets.chomp.to_i
      
    print "How many pets do you already own: "
    num_pets = gets.chomp
      
    shelter.clients.merge!(name => [name, num_children, age, num_pets])

    puts shelter

elsif response == "e"
  puts "Choose a client."
  puts shelter.clients.keys

  choice_client = gets.chomp

  puts "Chose an animal."
    puts shelter.animals.keys

    choice_animal = gets.chomp
#this pushes these variables into the array
    relationship.create_adopt( choice_client, choice_animal )
#binding.pry
#This should remove the client and animal from the shelter
    shelter.animals.delete(choice_animal.to_s)
    puts "This is what is currently left in the shelter: #{ shelter }"
    puts "This is who has been adopted: #{ relationship }"


elsif response == "f"
  print "Oh, so you want to give us an animal? What is your name you cold-hearted brute? "
    name = gets.chomp
      
    print "How many children do you neglect at home? "
    num_children = gets.chomp.to_i
      
    print "How many years have you advanced towards death? "
    age = gets.chomp.to_i
      
    print "How many other pets do you abuse? "
    num_pets = gets.chomp
      
    shelter.clients.merge!(name => [name, num_children, age, num_pets])

    print "What is the name of the foul creature you're giving us? "
    name = gets.chomp
      
    puts "How many wretched years has it lived? "
    age = gets.chomp.to_i
      
    print "Assuming it has one, what sex is it? "
    gender = gets.chomp
      
    print "What type of beast is it?"
    species = gets.chomp
      
    shelter.animals.merge!(name => [name, age, gender, species])
      
    puts shelter

end







