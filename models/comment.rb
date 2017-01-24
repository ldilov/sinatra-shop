# creates model for comments
class Comment < ActiveRecord::Base
  validates :description, null:false, length: { in: 5..255 }

  # associations
  belongs_to :user
  belongs_to :product

  # methods
  def user
    User.find(self.user_id)
  end

  def product
    Product.find(self.product_id)
  end
end
