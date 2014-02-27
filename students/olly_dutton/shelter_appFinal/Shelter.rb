class Shelter
	attr_accessor :clients, :animals
	def initialize 
		@clients = {}
		@animals = {}
	end

  def throwaway(client, animal)
    @client.merge!(client)
    @animal.merge!(animal)
    #binding.pry
  end

	def to_s
		puts "Clients in the shelter: #{@clients}."
		puts "Animals in the shelter: #{@animals}."
	end

end

