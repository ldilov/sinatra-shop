# creates model for user
require 'digest'
class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  USER_REGEX  = /\A^[a-z0-9_-]{3,15}\z/

  # foreign keys
  has_many  :comments
  # validation
  validates :username,  presence: true, uniqueness: true
  validates :username,  format: { with: USER_REGEX, message: "Invalid user!" }
  validates :password,  confirmation: true
  validates :password_confirmation, presence: true
  validates :level   ,  presence: true, :inclusion => {:in => [1,2]}
  validates :email   ,  format: { with: EMAIL_REGEX, message: "Must be something@domain" }

  # Execute password encryption before saving user
  before_save :encrypt_password
  after_save :clear_password

  # helper methods
  def rank
    level <= 1 ? 'Клиент' : 'Администратор'
  end

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(username, password)
    pass = Digest::MD5.hexdigest(password)
    where("username = ? AND password = ?", username, pass).first
  end

  def get_cart_items
    Cart.where(user_id: self.id).pluck(:product_id, :quantity)
  end

  def get_comments
    Comment.where(user_id: self.id).to_a
  end
end
