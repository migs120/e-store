class MainCategoryPic < ActiveRecord::Base
  belongs_to :maincategory
  mount_uploader :pic_url, PicUploader
end
