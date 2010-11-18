# Outgoing.rb

class Outgoing
  
  attr_accessor :type, :message, :unit, :value
    
  def initialize(type, message, unit, value)
    @type = type
    @message = message
    @unit = unit
    @value = value
  end
  
end