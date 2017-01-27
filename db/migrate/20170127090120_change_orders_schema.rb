class ChangeOrdersSchema < ActiveRecord::Migration[5.0]
  def change
    drop_table :orders
    create_table :orders do |t|
      t.references :user, index:true
      t.string     :first_name
      t.string     :last_name
      t.float      :price
      t.string     :delivery_address
      t.boolean    :is_completed
      t.timestamps
    end
    add_foreign_key :orders, :users
    say 'Orders table is created.'
  end
end
