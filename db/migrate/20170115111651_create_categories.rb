# creates Category table
class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text     :description
      t.string   :name
      t.string   :image_url
    end
  end
end
