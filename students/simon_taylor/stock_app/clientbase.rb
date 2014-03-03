class ClientBase
  attr_accessor :clients

  def initialize
    @clients = {}
  end

  def add_client(name, client)
    @clients[name] = client
  end

  def print_clients
    @clients.each_key do |name|
      puts "Client #{ name }"
    end
  end

  #used to validate a user input client name against the clients that exist
  def select_client
    #to store client name
    name = ""

    loop do
      #prompt user to select a client
      puts "Please enter the client's name (this is case sensitive)"
      puts "Existing clients are: \"#{ @clients.keys.sort.join("\", \"") }\""
      name = gets.chomp

      #check if selection is valid
      if @clients.has_key? name
        #stop looping
        break
      else
        #inform them invalid and re-loop
        puts "Please input a valid client name"
        puts "--------------------------------"
      end
    end

    #return client name
    name
  end

end