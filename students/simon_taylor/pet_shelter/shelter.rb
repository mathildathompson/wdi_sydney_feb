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
    animal = @animals[pet]
    @clients[person].pets[animal.name] = animal
    @animals.delete(pet)
  end

  def give_up(person, pet)
    animal = @clients[person].pets[pet]
    @animals[pet] = animal
    @clients[person].pets.delete(pet)
  end
end