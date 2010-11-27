require "classes/Nym.rb"

class NymController
  attr_accessor :nyms
  
  def initialize
    @nyms = load_nyms    
  end
  
  def load_nyms
    nym_count = Otapi.OT_API_GetNymCount
    
    nyms = Array.new
    
    nym_count.times do |i|
      nym = Nym.new      
      nym.id = Otapi.OT_API_GetNym_ID(i)
      nym.name = Otapi.OT_API_GetNym_Name(nym.id)
      nyms << nym
    end
    nyms
  end
  
end