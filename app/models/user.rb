class User < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations

  has_secure_password

  validates :username, uniqueness: true

end
