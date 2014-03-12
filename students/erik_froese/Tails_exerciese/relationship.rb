class Relationship
  attr_accessor :relationship
  def initialize
    @relationship = {}
  end
  # this is what the array will contain { client => [animal1, animal2, animal3]}

  def create_adopt(client, animal)
    @relationship[client] = []
    @relationship[client] << animal
    #binding.pry
  end
end