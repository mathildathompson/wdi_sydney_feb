class Client
    attr_accessor :name, :age, :children, :pets

    def initialize(name, age, children, pets)
        @name = name
        @age = age
        @children = children
        @pets = {}
    end
    
    def to_s
    "The client #{@name} who is #{@age} years young,
    and has #{@children} Children with #{@pets} pets"
    end
end          