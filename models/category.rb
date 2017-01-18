# creates Model for categories
class Category < ActiveRecord::Base
  URL_REGEX = /(https?:\/\/.*\.(?:png|jpg))/
  validates :name, null:false, length: { in: 5..50 }

  # associations
  has_many :products

  # methods
  def get_items
    Product.where(category_id: self.id).to_a
  end

end
