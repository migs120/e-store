class ItemPic < ActiveRecord::Base
  belongs_to :item
  mount_uploader :pic_url, PicUploader
end
