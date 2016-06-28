class MCategory < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
