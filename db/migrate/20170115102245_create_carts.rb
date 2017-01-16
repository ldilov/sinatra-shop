# creates Carts table
class CreateCarts < ActiveRecord::Migration[5.0]
  def change
<<<<<<< Updated upstream
    create_table :carts, id: false do |t|
      t.integer  :user_id
      t.integer  :quantity
      t.integer  :product_id
=======
    create_join_table :products, :users, table_name: :carts do |t|
      t.integer    :quantity
>>>>>>> Stashed changes
    end
    say 'Carts table is created.'
  end
end
