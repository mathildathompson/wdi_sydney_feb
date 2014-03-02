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
      puts name
    end
  end
  
end