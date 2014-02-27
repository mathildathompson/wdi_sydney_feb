class Client
    attr_accessor :name, :age, :children, :pets

    def initialize(name, age, children, pets)
        @name = name
        @age = age
        @children = children
        @pets = []
    end

    def to_s
        "#{@name} is #{age} years old, has #{children} children and #{pets} pets"
    end
    

end
