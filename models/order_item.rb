# creates model for order_items
class OrderItem < ActiveRecord::Base

  # associations
  belongs_to :order
  belongs_to :product

end
