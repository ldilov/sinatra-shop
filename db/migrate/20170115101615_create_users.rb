# creates users table
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :password, null: false
      t.integer :level,    null: false
      t.string  :email
      t.string  :gender
      t.string  :phone
      t.references :cart, index: true
      t.timestamps
    end
    add_foreign_key :users, :carts
    say 'Users table is created.'
  end
end
