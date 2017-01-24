# creates model for products
class Product < ActiveRecord::Base
  validates :price,  presence: true
  validates :quantity,  presence: true

  # associations
  belongs_to :category

  # methods
  def comments
    Comment.where(product_id: self.id).to_a
  end

  def category
    Category.find(self.category_id)
  end

end
