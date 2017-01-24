# creates Model for categories
class Category < ActiveRecord::Base
  validates :name, null:false, length: { in: 5..50 }

  # associations
  has_many :products, dependent: :destroy

  # methods
  def items
    Product.where(category_id: self.id).to_a
  end

  def items_ids
    Product.where(category_id: self.id).ids
  end
end
