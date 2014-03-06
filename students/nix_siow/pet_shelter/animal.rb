class Animal
  attr_accessor :name, :age, :gender, :species, :toys

  def initialize(name, age, gender, species)
    @name = name
    @age = age
    @gender = gender.downcase
    @species = species
    @toys = []
  end

  def to_s
    @gender == 'male' ? @he_she = 'he' : @he_she = 'she'

    puts "The pet's name is #{@name} and #{@he_she} is #{@age} years old."
    puts "This animal has #{@toys.size} toy(s)."
  end
end