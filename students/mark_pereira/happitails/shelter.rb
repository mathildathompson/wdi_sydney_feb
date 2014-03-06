class Shelter
    attr_accessor :clients, :animals

    def initialize
        @clients = {}
        @animals = {}
    end

    def to_s
        puts "these are a list of our clients: #{@clients}"
        puts "these are a list of our animals: #{@animals}"
    end
end    