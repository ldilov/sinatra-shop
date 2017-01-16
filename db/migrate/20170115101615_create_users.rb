# creates users table
class CreateUsers < ActiveRecord::Migration[5.0]
  has_many      :comments

  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :password, null: false
      t.integer :level,    null: false
      t.string  :email
      t.string  :gender
      t.string  :phone
      t.timestamps
    end
    say 'Users table is created.'
  end
end
