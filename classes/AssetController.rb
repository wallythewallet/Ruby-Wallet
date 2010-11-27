require "classes/Asset.rb"

class AssetController
  attr_accessor :assets

  def initialize
    @assets = load_assets    
  end

  def load_assets
    asset_count = Otapi.OT_API_GetAssetTypeCount

    assets = Array.new

    asset_count.times do |i|
      asset = Asset.new      
      asset.id = Otapi.OT_API_GetAssetType_ID(i)
      asset.name = Otapi.OT_API_GetAssetType_Name(asset.id)
      assets << asset
    end
    assets
  end

end