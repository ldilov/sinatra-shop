# creates Category table
class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :category do |t|
      t.text     :description
      t.string   :name
      t.string   :image_url
    end
  end
end
