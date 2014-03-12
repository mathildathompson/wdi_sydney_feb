class Shelter
	attr_accessor :clients, :animals
	def initialize 
		@clients = {}
		@animals = {}
	end

  def throwaway(client, animal)
    @client.merge(client)
    @animals.merge(animal)
    #binding.pry
  end

	def to_s
		puts "Clients in the shelter: #{@clients.keys}."
		puts "Animals in the shelter: #{@animals.keys}."
	end

end

