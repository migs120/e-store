class Item < ActiveRecord::Base
  belongs_to :main_category
  has_many :item_pics, dependent: :destroy
end
