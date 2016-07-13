class AddToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :price, :decimal
    add_column :items, :active, :boolean
    
  end
end
