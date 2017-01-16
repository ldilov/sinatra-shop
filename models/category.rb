# creates Model for categories
class Category < ActiveRecord::Base
  URL_REGEX = /(https?:\/\/.*\.(?:png|jpg))/
  validates :delivery_address, null:false, length: { in: 10..255 }
  validates :name, null:false, length: { in: 5..50 }
  validates :image_url, format: { with: USER_REGEX, message: "Invalid url!" }

  # associations
  has_many :products

  # methods
  def get_items
    Product.where(category_id: self.id)
  end

end
