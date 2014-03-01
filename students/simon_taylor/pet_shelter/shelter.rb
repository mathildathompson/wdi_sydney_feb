class Shelter
  attr_accessor :clients, :animals

  def initialize()
    @clients = {}
    @animals = {}
  end

  def print_animals
    @animals.each_value do |animal|
      animal.to_s
    end
  end

  def print_clients
    @clients.each_value do |client|
      client.to_s
    end
  end

  def adopt(person, pet)
    #find the animal object
    animal = @animals[pet]
    #add to the specified client the animal object
    @clients[person].pets[animal.name] = animal
    #remove this animal from the shelter
    @animals.delete(pet)
  end

  def give_up(person, pet)
    #find the animal object owned by the client
    animal = @clients[person].pets[pet]
    #add this animal to the shelter
    @animals[pet] = animal
    #remove this animal from the client
    @clients[person].pets.delete(pet)
  end
end