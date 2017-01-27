# creates model for products
class Product < ActiveRecord::Base
  validates :price,  presence: true
  validates :quantity,  presence: true

  # associations
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_many   :order_items, dependent: :destroy
end
