# creates Comments table
class CreateComments < ActiveRecord::Migration[5.0]

  def change
    create_table   :comments do |t|
      t.text       :description
      t.references :user,    index:true
      t.references :product, index: true
      t.timestamps
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :products
    say 'Comments table is created.'
  end
end
