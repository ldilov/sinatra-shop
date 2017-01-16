# creates Model for oders
class Order < ActiveRecord::Base
  validates :delivery_address, null:false, length: { in: 10..255 }

  # methods
  def get_date
    date = Array.new.push(created_at).push(updated_at)
  end

  def get_user
    User.find(self.user_id)
  end

  def get_product
    Product.find(self.product_id)
  end

  def complete
    self.is_completed = true
  end
end
