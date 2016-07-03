class MainCategory < ActiveRecord::Base
  has_many :main_category_pics, dependent: :destroy
<<<<<<< HEAD
=======
  has_many :items
>>>>>>> additems
end
