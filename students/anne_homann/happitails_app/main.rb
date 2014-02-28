require 'pry'
require_relative 'animal'
require_relative 'client'
require_relative 'shelter'

shelter = Shelter.new
shelter.animals["Butch"] = Animal.new("Butch", 3,"male","dog",5)
shelter.animals["Julius"] = Animal.new("Julius",7,"male","dog",2)
shelter.animals["Amy"] = Animal.new("Amy",3,"female","cat",5)
shelter.clients["Mary"] = Client.new("Mary", 5, 44, 9)
shelter.clients["Harry"] = Client.new("Harry", 5, 24, 1)
shelter.clients["Lisa"] = Client.new("Lisa", 52, 57, 4)


puts "Would you like to: "
puts "add an (a)nimal or a (c)lient"
puts "(d)isplay all clients and (l)ist all animals"
puts "(o)wn for adopting an animal"
puts "(g)iven up for adoption"
puts "or (q)uit?: "


response = gets.chomp.downcase


while response != 'q'

    if response == 'a'
        
        # if building.apartments.empty?
        #     puts "no apartment"
        #     response = 'a'
        #     next
        # end

        print 'name: '
        name = gets.chomp

        print 'age: '
        age = gets.to_i

        print 'gender: '
        gender = gets.chomp

        print 'species: '
        species = gets.chomp

        print 'toys: '
        toys = gets.chomp


        shelter.animals[name] = Animal.new(name, age, gender, species, toys)

        puts "You added an animal. #{shelter.animals[name]}"
        
    elsif response == 'c'

        print 'name: '
        name = gets.chomp

        print 'age:'
        age = gets.chomp.to_i

        print 'number of children: '
        children = gets.to_i

        print 'number of pets: '
        pets = gets.chomp.to_i

        
        shelter.clients[name] = Client.new(name, age, children, pets)

        puts "You added an client. #{shelter.clients[name]}"

    elsif response == 'd'

        shelter.animals.each do |foo|
            
            puts foo

        end    

    elsif response == 'l'
        shelter.clients.each do |bar|

            puts bar    
        end

    elsif response == 'o'


        puts "Here is a list of clients "
        shelter.clients.each do |foo|
            puts foo

        end

        puts "Which client wants to adopt? "
        adopting_client = gets.chomp


        puts "___________________________________________________"
        puts "Here is a list of animals: "
        shelter.animals.each do |foo|
            puts foo

        end

        puts "___________________________________________________"
        puts "Please type the name of the animal they want to adopt: "
        adoptionAnimal = gets.chomp


        animal = shelter.animals[adoptionAnimal]
        shelter.animals.delete(adoptionAnimal)
        puts "#{adopting_client} has adopted #{adoptionAnimal}! Thanks #{adopting_client}!"
        puts "___________________________________________________"
        # adoptionNew = shelter.animals.delete(adoptionAnimal)
        
        shelter.clients[adopting_client].pets[adoptionAnimal] = animal



    elsif response == 'g'

        puts "Here is a list of clients "
        shelter.clients.each do |foo|
            puts foo

        end

        puts "Which client wants to surrender an animal? "
        surrender_client = gets.chomp

        puts "___________________________________________________"
        puts "Here is a list of #{surrender_client}'s animals: "
        shelter.clients[surrender_client].pets.each do |foo|
            puts foo

        end

        puts "___________________________________________________"
        puts "Which animal would #{surrender_client} like to surrender? "
        surrendered_animal = gets.chomp

        animal = shelter.clients[surrender_client].pets[surrendered_animal]
        shelter.clients[surrender_client].pets.delete(surrendered_animal)
        shelter.animals[surrendered_animal] = animal
        puts "Thanks #{surrender_client} for giving us #{surrendered_animal}"
        puts "___________________________________________________"
               

        # if response == 'q'
        #     Kernal.exit(true)
        # end     

    end


    puts "Would you like to: "
    puts "add an (a)nimal or a (c)lient"
    puts "(d)isplay all clients and (l)ist all animals"
    puts "(o)wn for adopting an animal"
    puts "(g)iven up for adoption"
    puts "or (q)uit?: "
    response = gets.chomp.downcase

    
end
            





#binding.pry
