# creates Carts table
class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :users, table_name: :carts do |t|
      t.integer    :quantity
      t.index      :product_id
      t.index      :user_id
    end
    say 'Carts table is created.'
  end
end
