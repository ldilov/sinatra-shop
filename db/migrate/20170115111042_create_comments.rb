# creates Comments table
class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :product, index: true
      t.references :user,    index: true
      t.text       :description
      t.timestamps
    end
    add_foreign_key :comments, :products
    add_foreign_key :comments, :users
    say 'Comments table is created.'
  end
end
