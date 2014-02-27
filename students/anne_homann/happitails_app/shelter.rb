class Shelter
  attr_accessor :clients, :animals

  def initialize
    @clients = { }
    @animals = { }
  end

  def to_s
    "#{@name} is a #{@age} year old #{@gender}"
  end
end