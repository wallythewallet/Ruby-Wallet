require 'classes/Account.rb'
require 'otapi'

class AccountController
  
  attr_accessor :accounts
  
  def initialize
    init_wallet
    @accounts = load_accounts
  end
  
  def init_wallet
    path =  File.expand_path(File.dirname(__FILE__))
    substring = "classes"
    ss_start = path.index(substring)
    path[ss_start, substring.length] = ""
    path += "Open-Transactions/testwallet/data_folder"
    Otapi.OT_API_Init path
  end
    
  def load_accounts
    Otapi.OT_API_LoadWallet "Wallet.xml"
    count = Otapi.OT_API_GetAccountCount()

    accounts = Array.new
    
    count.times do |i|
      account = Account.new
      account.id = Otapi.OT_API_GetAccountWallet_ID(i)
      account.name = Otapi.OT_API_GetAccountWallet_Name(account.id)
      account.balance = Otapi.OT_API_GetAccountWallet_Balance(account.id)
      account.type = Otapi.OT_API_GetAccountWallet_Type(account.id)
      account.asset_type_id = Otapi.OT_API_GetAccountWallet_AssetTypeID(account.id)
      account.asset_type_name = Otapi.OT_API_GetAssetType_Name(account.asset_type_id);
      accounts << account
    end
        
    accounts
  end
  
end
