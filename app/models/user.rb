class User < ActiveRecord::Base
  has_many :reviews
  has_many :queue_items

  has_secure_password validations: false

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
  validates :name, presence: true
end