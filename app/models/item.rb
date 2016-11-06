class Item < ActiveRecord::Base
  belongs_to :main_category
  has_many :item_pics
  has_many :order_items, dependent: :destroy
  default_scope { where(active: true) }
end
