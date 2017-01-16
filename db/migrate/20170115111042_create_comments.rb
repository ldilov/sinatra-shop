# creates Comments table
class CreateComments < ActiveRecord::Migration[5.0]
  belongs_to     :users
  belongs_to     :products

  def change
    create_table :comments do |t|
      t.text     :description
      t.timestamps
    end
    say 'Comments table is created.'
  end
end
