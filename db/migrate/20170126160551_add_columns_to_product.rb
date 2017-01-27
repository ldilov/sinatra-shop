class AddColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :description, :string
    add_column :products, :title      , :string
  end
end
