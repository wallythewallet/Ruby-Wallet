# index.rb
require 'rubygems'
require 'sinatra'
require 'haml'
require 'classes/Wallet.rb'
require 'OTAPI'

menu = [
  {"name" => "Start", "link" => "/"},
  {"name" => "Transfers", "link" => "/transfers"},
  {"name" => "Cheques", "link" => "/cheques"},
  {"name" => "Cash", "link" => "/cash"}
  ]

# Show start page
get '/' do
  @wallet = Wallet.new
  @menu = menu
  haml :index
end

get '/transfers' do
  @menu = menu
  haml :transfers
end

get '/cheques' do
  @menu = menu
  haml :cheques
end

get '/cash' do
  @menu = menu
  haml :cash
end
