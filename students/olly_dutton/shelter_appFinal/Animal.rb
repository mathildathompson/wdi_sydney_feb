class Animal
	attr_accessor :name, :age, :gender, :species, :toys
	def initialize(name, age, gender, species, toys)
		@name = name
		@age = age.to_i
		@gender = gender
		@species = species
		@toys = toys
	end

     # def to_s
     #    print "#{@name}: a #{@gender} #{@species}. #{@age} years old".
     # end

end
