# Client:

# A client should have a name.
# A client should have a number of children.
# A client should have an age.
# A client should have a number of pets.

class Client
  attr_accessor :name, :children, :age, :pets

  def initialize(name, children, age)
    @name = name
    @children = children
    @age = age
    @pets = {}
  end

  def to_s
    puts "The client's name is #{@name} and he/she is #{@age} years old."
    puts "He/she has #{@children} children and has #{@pets.size} pet(s)."
  end
end