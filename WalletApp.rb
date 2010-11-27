#!/usr/bin/env ruby
# WalletApp.rb

require 'rubygems'
require 'sinatra'
require 'haml'
require 'otapi'
require 'classes/WalletController.rb'
require 'classes/ServerController.rb'
require 'classes/NymController.rb'
require 'classes/AssetController.rb'


module WalletModule

  class WalletApp < Sinatra::Base

    set :public => "public"

    attr_accessor :menu, :wallet_controller, :server_controller, :nym_controller, :asset_controller

    def initialize
      super
      
      @menu = [
        {:name => "Start", :link => "/"},
        {:name => "Transfers", :link => "/transfers"},
        {:name => "Cheques", :link => "/cheques"},
        {:name => "Cash", :link => "/cash"},
        {:name => "Servers", :link => "/servers"},
        {:name => "Nyms", :link => "/nyms"},
        {:name => "Wallets", :link => "/wallets"},
        {:name => "Assets", :link => "/assets"}
      ]
        
      @wallet_controller = WalletController.new
      @server_controller = ServerController.new
      @nym_controller = NymController.new
      @asset_controller = AssetController.new
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
      @wallet_controller.write_cheque(params)
      redirect "/cheques"
    end

    get '/cash' do
      haml :cash
    end
    
    get '/servers' do
      haml :servers
    end
    
    get '/nyms' do
      haml :nyms
    end
    
    get '/assets' do
      haml :assets
    end
    
    get '/wallets' do
      haml :wallets
    end

  end

  WalletApp.run!

end

