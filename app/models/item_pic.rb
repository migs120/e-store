class ItemPic < ActiveRecord::Base
  belongs_to :item, dependent: :destroy
  mount_uploader :pic_url, PicUploader
 # serialize :description
  
  #rescue ActiveMerchant::ActiveMerchantError => e
  #self.description        = {}
  
end
#ItemPic.where(name:"template").last.description['Build']