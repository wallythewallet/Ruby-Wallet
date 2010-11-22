# WalletController.rb

require './Asset.rb'
require 'Incoming.rb'
require 'Outgoing.rb'
require 'Wallet.rb'
require 'OTAPI'

class WalletController
  
  attr_accessor :assets, :inbox, :outbox
  
  def initialize
    gold = Asset.new("Gold", "g", 100)
    dollar = Asset.new("Dollar", "$", 400)
    euro = Asset.new("Euro", "e", 300)
    bitcoins = Asset.new("BitCoins", "bc", 200)
    
    @assets = [gold, dollar, euro, bitcoins]
    
    new_cheque = Incoming.new("Cheque", "Your salary", "$", "500")
    franks_transfer = Incoming.new("Transfer", "Payback", "bc", "100")
    lisas_cheque = Incoming.new("Cheque", "Happy Birthday", "e", "50")
    
    request_inbox
    load_wallet
    @inbox = [new_cheque, franks_transfer, lisas_cheque]
    
    rent_cheque = Incoming.new("Cheque", "Rent for November", "$", "300")
    transfer_pending = Incoming.new("Transfer", "Hosting cost", "bc", "100")
        
    @outbox = [rent_cheque, transfer_pending]    
  end
  
  def get_account_count
    account_count = OTAPI.OT_API_GetAccountCount()    
  end
  
  def load_wallet

    count = get_account_count
    puts count
    
    count.each do |i|
      id = OT_API_GetAccountWallet_ID(i)
      name = OT_API_GetAccountWallet_Name(i)
      balance = OT_API_GetAccountWallet_Balance(i)
      type = OT_API_GetAccountWallet_Type(i)
      asset_type_id = OTAPI.OT_API_GetAccountWallet_AssetTypeID(i)
    end
    
    
  end
  
  def request_inbox
    # simple user from test installation
    server_id = "4cc4dd50cb6a7d9c7d05240e09daf2befcd189331d69a07f7dd11ed86967de12c9ffd4e3c2d70d0d7a02891e280f2df1fdf05543586840f2bf7b37d4299ad6de"
    user_id = "7d1cff65a7febacaa0bbab73fd65032e6620e6501f41961b2be3ad556d891d4f5cab52acc87c07da91fbdc940da865249cb6e0b3a6fe7d66f6b3f8eb94591b5d"
    account_id = "205a5652e01e769d0af6c7dd73b2ea0fae12a1a00cdd29b7e43762df8673889043555767627ff5f283c7ad699bf8f4c22380e4df5f49d121f05245e59d971286"
    # OT_API_getInbox(server_id, user_id, account_id)
  end
  
  def write_cheque(params)
    server_id = params['server_id']
    cheque_amount = params['cheque_amount']
    valid_from = params['valid_from']
    valit_to = params['valit_to']
    sender_account_id = params['sender_account_id']
    sender_user_id = params['sender_user_id']
    cheque_memo = params['cheque_memo']
    recipient_user_id = params['recipient_user_id']
    OT_API_WriteCheque(server_id, cheque_amount, valid_from, valit_to, sender_account_id, 
              sender_user_id, cheque_memo, recipient_user_id)
  end
  
end
