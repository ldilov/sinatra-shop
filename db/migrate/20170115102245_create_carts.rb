# creates Carts table
class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer    :quantity
      t.references :product, index: true
    end
    add_foreign_key :carts, :products
    say 'Carts table is created.'
  end
end
