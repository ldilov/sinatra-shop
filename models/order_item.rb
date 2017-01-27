# creates model for order_items
class Order_item < ActiveRecord::Base

  # associations
  belongs_to :order
  belongs_to :product

end
