# creates Orders table
class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.boolean :is_completed
      t.text    :delivery_address
      t.timestamps
    end
    say 'Orders table is created.'
  end
end
