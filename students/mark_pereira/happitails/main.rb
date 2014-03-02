require 'pry'

require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

#----------------------------------------------------------------------------------
# Test data set up for troubleshooting and testing.

shelter.animals["Spot"] = Animal.new("Spot", 12, "male", "dog", ["bone", "frisbee"])
shelter.animals["Missy"] = Animal.new("Missy", 4, "female", "cat", ["wool", "mouse"])
shelter.animals["Fluff"] = Animal.new("Fluff", 4, "female", "hamster", ["wheel", "block"])

shelter.clients["Bob"] = Client.new("Bob", 45, "2", ["Toby", "Henny"])
shelter.clients["Bob"].pets['Spot'] =  shelter.animals["Spot"]
shelter.clients["Jim"] = Client.new("Jim", 32, "1", ["Fido"])
shelter.clients["Ann"] = Client.new("Ann", 29, "0", ["Fido"] )

#-----------------------------------------------------------------------------------

shelter = Shelter.new
  puts "1. Create animal"
  puts "2. Create client"
  puts "3. Display animals"
  puts "4. Display clients"
  puts "5. Adopt animal"
  puts "6. Surrender animal"
  puts "7. Quit"

response = gets.chomp.to_i

while response != 7

#-----------------------------------------------------------------------------------
# Add a new pet   
  if response == 1
    print ' name : '
      name = gets.chomp 
    print ' age '    
        age = gets.to_i
    print ' gender :'
        gender = gets.chomp
    print ' species : '
        species = gets.chomp
    print ' list toys :'
        toys = gets.chomp.split.to_a
  end
    
    shelter.animals[name] = Animal.new(name, age, gender, species, toys)   

#-----------------------------------------------------------------------------------
# Add a new client
  elsif response == 2 
    print ' name : '
      name = gets.chomp 
    print ' age '
      age = gets.to_i
    print ' kids :'
      kids = gets.to_i
    print ' pets :'
      pets = gets.chomp.split.to_a
  end    
    
    shelter.clients[name] = Client.new(name, age, kids, pets) 

#-----------------------------------------------------------------------------------
#Print a list of all animals available in the shelter
  elsif response == 3 
    shelter.animals.each do |animal|
      puts animal
    end 
  end     

#-----------------------------------------------------------------------------------
#Print a list of all clients 
  elsif response == 4 
    shelter.clients.each do |client|
      puts client
    end  
  end

#-----------------------------------------------------------------------------------
#Adopting a pet
  elsif response == 5 
    shelter.animals.each do |key, value|
      puts value.name
    end            
    puts "Which animal would you like to adopt?"
      adopt = gets.chomp
        
    shelter.clients.each do |key, value|
      puts value.name
    end
    
    puts "choose a client"
        adopter = gets.chomp

    shelter.clients[adopter].pets[adopt] = shelter.animals[adopt]
    shelter.animals.delete(adopt)       

    puts "#{shelter.clients[adopter].name} your pets are now #{shelter.clients[adopter].pets}"
  end  

#-----------------------------------------------------------------------------------
#Surrending a pet
  elsif response == 6 
    shelter.clients.each do |key, value|
      puts value.name
    end
  end    
     
    puts "choose a client to give up a pet"
      deserter = gets.chomp
    
    puts "Which animal would you like to give up?"
      shelter.clients[deserter].pets.each do |key, value|
        puts value.name
      end
        deserted = gets.chomp

    shelter.animals[deserted] = shelter.clients[deserter].pets[deserted]
    shelter.clients[deserter].pets.delete(deserted)
        
 
      returning = shelter.clients[deserter].pets.find{|k,v| k == deserted }
        # the value here needs to be re-added to the animals.class
        puts "returning animal = #{returning}"
      end    
end

    puts "1. Create animal"
    puts "2. Create client"
    puts "3. Display animals"
    puts "4. Display clients"
    puts "5. Adopt animal"
    puts "6. Surrender animal"
    puts "7. Quit"

    response = gets.chomp.to_i

#end

#-----------------------------------------------------------------------------------
# Exit application

  else response == 7
    Kernel.exit(true) 
  end     
#-----------------------------------------------------------------------------------       