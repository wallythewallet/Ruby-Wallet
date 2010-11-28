#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'
require 'otapi'
require 'classes/AccountController.rb'
require 'classes/ServerController.rb'
require 'classes/NymController.rb'
require 'classes/AssetController.rb'
require 'classes/InboxController.rb'
require 'classes/OutboxController.rb'

module WalletModule

  class WalletApp < Sinatra::Base

    set :public => "public"

    attr_accessor :menu, :account_controller, :server_controller, :nym_controller, :asset_controller, :inbox_controller, :outbox_controller

    def initialize
      super
      
      @menu = [
        {:name => "Start", :link => "/"},
        {:name => "Transfers", :link => "/transfers"},
        {:name => "Cheques", :link => "/cheques"},
        {:name => "Cash", :link => "/cash"},
        {:name => "Servers", :link => "/servers"},
        {:name => "Nyms", :link => "/nyms"},
        {:name => "Accounts", :link => "/accounts"},
        {:name => "Assets", :link => "/assets"},
        {:name => "Inbox", :link => "/inbox"},
        {:name => "Outbox", :link => "/outbox"}
      ]
        
      @account_controller = AccountController.new
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
    
    get '/accounts' do
      haml :accounts
    end

    get '/inbox' do
      haml :select_inbox
    end
    
    post '/inbox' do
      puts params
      server_id = ""
      user_id = ""
      account_id = ""
      @inbox_controller = InboxController.new server_id, user_id, account_id
      haml :inbox
    end

    get '/outbox' do
      haml :outbox
    end

  end

  WalletApp.run!

end

