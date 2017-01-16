# creates model for products
class Product < ActiveRecord::Base
  validates :price,  presence: true
  validates :quantity,  presence: true

  # associations
  belongs_to :category

  # methods
  def get_comments
    Comment.find_by(product_id: self.id)
  end

  def get_category
    Category.find(self.category_id)
  end

end
