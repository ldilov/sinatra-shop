# creates Model for oders
class Order < ActiveRecord::Base

  #associations
  has_many   :order_items, dependent: :destroy
  belongs_to :user

  # methods
  def date
    date = Array.new.push(created_at).push(updated_at)
  end

  def user
    User.find(self.user_id)
  end

  def product
    Product.find(self.product_id)
  end

  def complete
    self.is_completed = true
  end
end
