#!/usr/bin/env ruby
# index.rb

require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'classes/Wallet.rb'
require 'OTAPI'

module WalletModule

  class WalletApp < Sinatra::Base

    set :public => "public"

    attr_accessor :menu, :wallet

    def initialize
      super
      
      @menu = [
        {"name" => "Start", "link" => "/"},
        {"name" => "Transfers", "link" => "/transfers"},
        {"name" => "Cheques", "link" => "/cheques"},
        {"name" => "Cash", "link" => "/cash"}
        ]
        
      @wallet = Wallet.new  
    end

    get '/' do
      haml :index
    end

    get '/transfers' do
      haml :transfers
    end

    get '/cheques' do
      haml :cheques
    end

    post '/cheques' do
      @wallet.write_cheque(params)
      redirect "/cheques"
    end

    get '/cash' do
      haml :cash
    end

  end

  WalletApp.run!

end

