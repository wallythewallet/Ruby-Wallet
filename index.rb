# myapp.rb
require 'sinatra'

get '/' do
  "Hello World! It is #{Time.now} at the server!"
end

get '/hello/:name' do
  "Hello #{params[:name]}!"
end

