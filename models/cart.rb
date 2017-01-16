# creates a model for carts
class Cart < ActiveRecord::Base
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # methods
  def self.get_items(userid)
    where(user_id: userid)
  end

end
