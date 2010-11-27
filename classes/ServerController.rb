require "classes/Server.rb"

class ServerController
  attr_accessor :servers
  
  def initialize
    @servers = load_servers 
  end
  
  def load_servers
    server_count = Otapi.OT_API_GetServerCount
    
    servers = Array.new
    
    server_count.times do |i|
      server = Server.new  
      server.id = Otapi.OT_API_GetServer_ID(i)
      server.name = Otapi.OT_API_GetServer_Name(server.id)
      servers << server
    end
    servers
  end
  
end