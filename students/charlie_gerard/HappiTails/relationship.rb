class Relationship
  attr_accessor :adopter, :adopted
  def initialize (adopter, adopted)
    @adopter = adopter
    @adopted = adopted
  end
  # this is what the array will contain { client => [animal1, animal2, animal3]}

  def create_adopt(adopter, adopted)
    @relationship[adopter] = {}
    @relationship[adopter] = adopted
    #binding.pry
  end
end