# create Products table
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.float   :price,    null: false
      t.integer :quantity, null: false
      t.integer :ram
      t.float   :cpu_frequency
      t.string  :cpu_name
      t.integer :cpu_model_number
      t.integer :gpu_vram
      t.string  :gpu_brand
      t.integer :gpu_mem_bus_wdith
      t.integer :gpu_directx
      t.string  :storage_brand
      t.boolean :storage_ssd
      t.integer :storage_size
      t.integer :storage_rpm
      t.integer :storage_sata_version
      t.integer :storage_count
      t.string  :psu_brand
      t.integer :psu_power
      t.integer :psu_efficiency
      t.integer :psu_amps_12v_rail
      t.string  :image_url
      t.references :category, index:true
    end
    add_foreign_key :products, :categories
    say 'Products table is created.'
  end
end
