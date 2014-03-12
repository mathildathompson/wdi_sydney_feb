class Client
    attr_accessor :name, :age, :children, :pets

    def initialize(name, age, children, pets)
        @name = name
        @age = age
        @children = children
        @pets = {}
        
        pets.each do |pet|
            @pets[pet] = Animal.new(pet, nil, nil, nil, nil)
        end
    end

    def to_s
        "#{@name} is #{age} years old, has #{children} children and #{pets} pets"
    end
    

end
