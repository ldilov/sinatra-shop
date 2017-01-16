# creates Orders table
class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :users, table_name: :orders do |t|
      t.integer :quantity, null: false
      t.boolean :is_completed
      t.text    :delivery_address
      t.timestamps
    end
    say 'Orders table is created.'
  end
end
