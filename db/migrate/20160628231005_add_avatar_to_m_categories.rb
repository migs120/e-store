class AddAvatarToMCategories < ActiveRecord::Migration
  def change
    add_column :m_categories, :avatar, :string
  end
end
