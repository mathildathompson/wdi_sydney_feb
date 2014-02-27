class Client
  attr_accessor :name, :children, :age, :pets

  def initialize(name, children, age, pets)
    @name = name
    @children = children
    @age = age
    @pets = pets
  end

 def to_s
    "#{@name} is #{@age} years old, has #{@children} children and #{@pets} pets"
  end
end