# Wallet.rb

require 'classes/Asset.rb'
require 'classes/Incoming.rb'
require 'classes/Outgoing.rb'

class Wallet
  
  attr_accessor :assets, :inbox, :outbox
  
  def initialize
    gold = Asset.new("Gold", "g", 100)
    dollar = Asset.new("Dollar", "$", 400)
    euro = Asset.new("Euro", "€", 300)
    bitcoins = Asset.new("BitCoins", "bc", 200)
    
    @assets = [gold, dollar, euro, bitcoins]
    
    new_cheque = Incoming.new("Cheque", "Your salary", "$", "500")
    franks_transfer = Incoming.new("Transfer", "Payback", "bc", "100")
    lisas_cheque = Incoming.new("Cheque", "Happy Birthday", "€", "50")
    
    @inbox = [new_cheque, franks_transfer, lisas_cheque]
    
    rent_cheque = Incoming.new("Cheque", "Rent for November", "$", "300")
    transfer_pending = Incoming.new("Transfer", "Hosting cost", "bc", "100")
        
    @outbox = [rent_cheque, transfer_pending]
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
