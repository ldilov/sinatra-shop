class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order,    index:true
      t.references :product, index: true
      t.integer    :quantity
    end
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :products
    say 'Order_items is created'
  end
end
