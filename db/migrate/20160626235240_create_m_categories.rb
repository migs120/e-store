class CreateMCategories < ActiveRecord::Migration
  def change
    create_table :m_categories do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
