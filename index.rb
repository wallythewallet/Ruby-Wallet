# index.rb
require 'rubygems'
require 'sinatra'
require 'haml'
require 'classes/Wallet.rb'

# Show start page
get '/' do
  @wallet = Wallet.new  
  haml :index
end
