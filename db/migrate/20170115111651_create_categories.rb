# creates Category table
class CreateCategories < ActiveRecord::Migration[5.0]
  has_many       :products

  def change
    create_table :category do |t|
      t.text     :description
      t.string   :name
      t.string   :image_url
    end
  end
end
