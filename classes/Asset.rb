# Asset.rb

class Asset
  
  attr_accessor :name, :value, :shortsign
  
  def initialize(name, shortsign, value)
    @name = name
    @shortsign = shortsign
    @value = value
  end
  
end