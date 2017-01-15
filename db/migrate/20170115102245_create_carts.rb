# creates Carts table
class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts, id: false do |t|
      t.integer  :user_id
      t.integer  :quantity
      t.integer  :product_id
    end
    say 'Carts table is created.'
  end
end
