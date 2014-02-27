class Client 
	attr_accessor :name, :num_children, :age, :num_pets
	def initialize (name, num_children, age, num_pets)
		@name = name
		@num_children = num_children.to_i
		@age = age
		@num_pets = num_pets
	end

     def to_s
        puts "#{@name}"
     end
end
