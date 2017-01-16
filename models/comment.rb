# creates model for comments
class Comment < ActiveRecord::Base
  validates :description, null:false, length: { in: 5..255 }

  # associations
  belongs_to :user
  belongs_to :product

  # methods
  def get_user
    User.find(self.user_id)
  end

  def get_product
    Product.find(self.product_id)
  end
end
