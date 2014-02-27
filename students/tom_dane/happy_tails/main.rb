require 'pry'
require_relative 'animal'
require_relative 'client'
require_relative 'shelter'

shelter = Shelter.new
shelter.animals["Butch"] = Animal.new("Butch", 3,"male","dog",5)
shelter.animals["Julius"] = Animal.new("Julius",7,"male","dog",2)
shelter.animals["Amy"] = Animal.new("Amy",3,"female","cat",5)
shelter.clients["Mary"] = Client.new("Mary", 44, 5, ["Fido","Milo"])
shelter.clients["Jesus"] = Client.new("Jesus", 44, 5, ["Spot","Fluffy"])


puts "Would you like to: "
puts "add an (a)nimal or a (c)lient"
puts "(d)isplay all clients and (l)ist all animals"
puts "(o)wn for adopting an animal"
puts "(s)urrender a pet"
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


        shelter.animals << Animal.new(name, age, gender, species, toys)

        puts "You added an animal. #{shelter.animals.last}"
        
    elsif response == 'c'

        print 'name: '
        name = gets.chomp

        print 'age:'
        age = gets.chomp.to_i

        print 'number of children: '
        children = gets.to_i

        print 'number of pets: '
        pets = gets.chomp.to_i

        
        shelter.clients << Client.new(name, age, children, pets)

        puts "You added an client. #{shelter.clients.last}"

    elsif response == 'd'

       shelter.animals.each do |foo|
            
            puts foo

        end    

        shelter.clients.each do |bar|

            puts bar    
        end

    elsif response == 'o'

        puts "Here is a list of clients"

            shelter.clients.each do |foo|
                    
                puts foo
               

            end
             
            puts "Which client wants to adopt? "
            adoptingClient = gets.chomp


            puts "------------------------------------------"
            puts "Here is a list of animals"

            shelter.animals.each do |foo|
                    
                puts foo
                
            end
            puts "------------------------------------------"
            puts "Please type the name of the animal they want to adopt: "
            adoptionAnimal = gets.chomp

            

            if shelter.animals.find(adoptionAnimal)

                #instead you can do shelter.animals[adoptionAnimal]
                #also store pets of clients in a hash. Animals are
                #always stored in hashes. 
                # to print just animals shelter.animals.pets.keys

                
                adoptionChoicenew = shelter.animals.delete(adoptionAnimal)
                puts "#{adoptionChoicenew}"
               
                   #now we are going to add the adoptionAnimal to the list of pets
                   #of adoption client

                shelter.clients[adoptingClient].pets << adoptionAnimal 

                puts "#{adoptingClient} has adopted #{adoptionAnimal}"

                binding.pry

                #   adoptingClient.each do |x,y|

                #     puts "#{x} has adopted #{y}"

                # end

                  

                # adoptingClient.each do |x,y|
                #     puts "#{y}"
                # end



            else

                puts "I don't recognise that animal. Please type again"

            end
        elsif response == 's'

            puts "We are going to delete your animal"
            puts "And add it into our database"

            puts "Which client wants to surrender a pet?"
            surrenderClient = gets.chomp

            

            shelter.clients

            


        #         else 
                
        #             puts "test"    

        #         end

        #     end

        

            # puts "Select animal by name"
            # name = gets.chomp
            # shelter.animals.each


            # elsif animals[available] == 'not available'

            #     puts "Sorry this animal is taken"

    end
            
            


print "Would you like to add an (a)nimal or a (c)lient or (q)uit?: "
response = gets.chomp.downcase

end

puts animal
puts client

# building.apartments.each do |apt|
#     puts apt
# end

# print "add (p)erson or (a)partment or (q)uit: "

# response = get.chomp.downcase

# end

#binding.pry
