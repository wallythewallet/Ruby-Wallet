require 'classes/Wallet.rb'
require 'otapi'

class WalletController
  
  attr_accessor :wallets
  
  def initialize
    init_wallet    
    @wallets = load_wallets
  end
  
  def init_wallet
    path =  File.expand_path(File.dirname(__FILE__))
    substring = "classes"
    ss_start = path.index(substring)
    path[ss_start, substring.length] = ""
    path += "Open-Transactions/testwallet/data_folder"
    Otapi.OT_API_Init path
  end
    
  def load_wallets
    Otapi.OT_API_LoadWallet "wallet.xml"    
    count = Otapi.OT_API_GetAccountCount()

    wallets = Array.new
    
    count.times do |i|
      wallet = Wallet.new
      wallet.id = Otapi.OT_API_GetAccountWallet_ID(i)
      wallet.name = Otapi.OT_API_GetAccountWallet_Name(wallet.id)
      wallet.balance = Otapi.OT_API_GetAccountWallet_Balance(wallet.id)
      wallet.type = Otapi.OT_API_GetAccountWallet_Type(wallet.id)
      wallet.asset_type_id = Otapi.OT_API_GetAccountWallet_AssetTypeID(wallet.id)
      wallet.asset_type_name = Otapi.OT_API_GetAssetType_Name(wallet.asset_type_id);
      wallets << wallet
    end
        
    wallets
  end
  
end
